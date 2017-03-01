#!/bin/sh

pkgname=bareboard
SKIP_ARCH_CHECK=1
pkgver=0.4
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i -e "s/'png'/os.sep, 'usr', 'share', 'bareboard', 'png'/g" bareboard.py
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/bin
    cp bareboard.py ${pkgdir}/usr/bin/bareboard
    chmod +x ${pkgdir}/usr/bin/bareboard
    mkdir -p ${pkgdir}/usr/share/bareboard/png
    cp -r png/* ${pkgdir}/usr/share/bareboard/png
}
