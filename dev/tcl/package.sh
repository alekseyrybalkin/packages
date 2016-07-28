#!/bin/sh

pkgname=tcl
pkgver=8.6.6
vcs=fossil
fossiltag=core-${pkgver//\./-}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    cd unix
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --enable-threads \
        --enable-64bit
    make
}

kiin_install() {
    cd unix
    make INSTALL_ROOT=${pkgdir} install install-private-headers
    ln -sf tclsh${pkgver%.*} ${pkgdir}/usr/bin/tclsh
    ln -sf libtcl${pkgver%.*}.so ${pkgdir}/usr/lib/libtcl.so

    # remove buildroot traces
    sed -e "s#${srcdir}/unix#/usr/lib#g" \
        -e "s#${srcdir}#/usr/include#g" \
        -i "${pkgdir}/usr/lib/tclConfig.sh"
    # remove man pages
    rm -rf ${pkgdir}/usr/share
}
