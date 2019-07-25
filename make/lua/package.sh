#!/bin/sh

pkgname=lua
_release=5.3
pkgver=${_release}.5
vcs=git
gittag=v${pkgver}
relmon_id=1847

kiin_make() {
    sed -i -e 's/local\///g' luaconf.h
    rm makefile
    cp ../Makefile.src ./Makefile

    git clone `find_vcs_repo luac`
    mv luac/luac.c .
    rm -rf luac

    cd ${location}
    mv ${pkgname}-${pkgver} src
    mkdir ${pkgname}-${pkgver}
    mv src Makefile ${pkgname}-${pkgver}/
    cd ${pkgname}-${pkgver}

    make MYCFLAGS="${CFLAGS} -fPIC" linux
}

kiin_install() {
    make \
        TO_LIB="liblua.a liblua.so liblua.so.${_release} liblua.so.${pkgver}" \
        INSTALL_DATA='cp -d' \
        INSTALL_TOP=${pkgdir}/usr \
        INSTALL_MAN=${pkgdir}/usr/share/man/man1 \
        install
    ln -sf lua ${pkgdir}/usr/bin/lua${_release}
    ln -sf luac ${pkgdir}/usr/bin/luac${_release}
    ln -sf liblua.so.${pkgver} ${pkgdir}/usr/lib/liblua${_release}.so

    rm -rf ${pkgdir}/usr/{share,lib/lua}

    mkdir -p ${pkgdir}/usr/lib/pkgconfig/
    cat > ${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc << EOF
V=${_release}
R=${pkgver}

prefix=/usr
INSTALL_BIN=\${prefix}/bin
INSTALL_INC=\${prefix}/include
INSTALL_LIB=\${prefix}/lib
INSTALL_MAN=\${prefix}/man/man1
INSTALL_LMOD=\${prefix}/share/lua/\${V}
INSTALL_CMOD=\${prefix}/lib/lua/\${V}
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: Lua
Description: An Extensible Extension Language
Version: \${R}
Requires: 
Libs: -L\${libdir} -llua -lm
Cflags: -I\${includedir}
EOF
}
