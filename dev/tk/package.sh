#!/bin/sh

pkgname=tk
pkgver=8.6.8
vcs=fossil
fossiltag=core-${pkgver//\./-}
relmon_id=11426

undead_make() {
    cd unix
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --enable-threads \
        --enable-64bit
    make
}

undead_install() {
    cd unix
    make INSTALL_ROOT=${pkgdir} install install-private-headers
    ln -sf wish${pkgver%.*} "${pkgdir}/usr/bin/wish"
    ln -sf libtk${pkgver%.*}.so "${pkgdir}/usr/lib/libtk.so"

    # remove buildroot traces
    sed -e "s#${srcdir}/tk${pkgver}/unix#/usr/lib#" \
        -e "s#${srcdir}/tk${pkgver}#/usr/include#" \
        -i "${pkgdir}/usr/lib/tkConfig.sh"
    # remove man pages
    rm -rf ${pkgdir}/usr/share
}
