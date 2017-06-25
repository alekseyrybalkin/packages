#!/bin/sh

pkgname=ublock
SKIP_ARCH_CHECK=1
pkgver=1.13.2
vcs=git
gittag=${pkgver}

kiin_make() {
    cd ../
    git clone ${SOURCES_HOME}/uassets uAssets
    cd ${srcdir}
    tools/make-chromium.sh .
    tools/make-firefox.sh .
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib/chromium/extensions/
    cp -r dist/build/*.chromium ${pkgdir}/usr/lib/chromium/extensions/ublock

    cd dist/build/*.firefox
    emid="uBlock0@raymondhill.net"

    mkdir -p ${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
    cp -r * ${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
    find ${pkgdir} -type d -exec chmod 0755 {} \;
    find ${pkgdir} -type f -exec chmod 0644 {} \;
}
