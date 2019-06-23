#!/bin/sh

pkgname=firefox-ublock-origin
pkgver=1.16.4.11
vcs=git
vcs_pkgname=ublock
gittag=firefox-legacy-${pkgver}
relmon_id=16686

kiin_make() {
    git clone ${SOURCES_HOME}/chromium/uassets ../uAssets
    tools/make-firefox-legacy.sh all
}

kiin_install() {
    install -Dm644 dist/build/uBlock0.firefox-legacy.xpi ${pkgdir}/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
    rm -rf ../uAssets
}
