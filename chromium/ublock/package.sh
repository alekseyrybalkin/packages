#!/bin/sh

pkgname=ublock
pkgver=1.20.0
vcs=git
gittag=${pkgver}
relmon_id=16686

kiin_make() {
    cd ../
    git clone `find_vcs_repo uassets` uAssets
    cd ${pkgname}-${pkgver}
    tools/make-chromium.sh .
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib/chromium/extensions/
    cp -r dist/build/*.chromium ${pkgdir}/usr/lib/chromium/extensions/ublock
    find ${pkgdir} -type d -exec chmod 0755 {} \;
    find ${pkgdir} -type f -exec chmod 0644 {} \;

    rm -rf ../uAssets
}
