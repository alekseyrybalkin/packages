#!/bin/sh

pkgname=lua52
pkgver=5.2.4
#vcs=git
#gittag=4324904b60db5243ede68d0922c1bf3c0dd05986
vcs_pkgname=lua
urls="https://www.lua.org/ftp/lua-${pkgver}.tar.gz"
srctar=lua-${pkgver}.tar.gz
srcdir=${location}/lua-${pkgver}

kiin_make() {
    patch -p1 -i ../liblua.so.patch

    sed "s/%VER%/${pkgver%.*}/g;s/%REL%/${pkgver}/g" ../lua.pc > lua.pc
    sed -e 's:llua:llua5.2:' -e 's:/include:/include/lua5.2:' -i lua.pc
    sed -r -e '/^LUA_(SO|A|T)=/ s/lua/lua5.2/' -e '/^LUAC_T=/ s/luac/luac5.2/' -i src/Makefile
    make MYCFLAGS="${CFLAGS} -fPIC" MYLDFLAGS="${LDFLAGS}" linux
}

kiin_install() {
    make \
        TO_BIN='lua5.2 luac5.2' \
        TO_LIB="liblua5.2.a liblua5.2.so liblua5.2.so.5.2 liblua5.2.so.${pkgver}" \
        INSTALL_DATA='cp -d' \
        INSTALL_TOP=${pkgdir}/usr \
        INSTALL_INC=${pkgdir}/usr/include/lua5.2 \
        INSTALL_MAN=${pkgdir}/usr/share/man/man1 \
        install

    install -Dm644 lua.pc ${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc

    install -d ${pkgdir}/usr/share/doc/${pkgname}
    install -m644 doc/*.{gif,png,css,html} ${pkgdir}/usr/share/doc/${pkgname}

    ln -s liblua5.2.so ${pkgdir}/usr/lib/liblua.so.5.2
    ln -s liblua5.2.so ${pkgdir}/usr/lib/liblua.so.${pkgver}

    cd ${pkgdir}/usr/share/man/man1
    mv lua.1 lua5.2.1
    mv luac.1 luac5.2.1
}
