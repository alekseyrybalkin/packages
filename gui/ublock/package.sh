#!/bin/sh

pkgname=ublock
SKIP_ARCH_CHECK=1
pkgver=1.14.18
vcs=git
gittag=${pkgver}

kiin_make() {
    cd ../
    git clone ${SOURCES_HOME}/uassets uAssets
    cd ${srcdir}
    tools/make-chromium.sh .
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib/chromium/extensions/
    cp -r dist/build/*.chromium ${pkgdir}/usr/lib/chromium/extensions/ublock
    find ${pkgdir} -type d -exec chmod 0755 {} \;
    find ${pkgdir} -type f -exec chmod 0644 {} \;
}
