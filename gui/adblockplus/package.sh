#!/bin/sh

pkgname=adblockplus
ARCH_NAME=firefox-adblock-plus
pkgver=2.8.2
vcs=mercurial
hgtag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    hg clone ${KIIN_HOME}/sources/buildtools buildtools
    cd buildtools
    hg clone ${KIIN_HOME}/sources/jshydra jshydra
    cd ..
    hg clone ${KIIN_HOME}/sources/adblockpluscore adblockpluscore
    cd adblockpluscore
    hg clone ${KIIN_HOME}/sources/buildtools buildtools
    cd buildtools
    hg clone ${KIIN_HOME}/sources/jshydra jshydra
    cd ../..
    hg clone ${KIIN_HOME}/sources/adblockplusui adblockplusui
    cd adblockplusui
    hg clone ${KIIN_HOME}/sources/buildtools buildtools
    cd buildtools
    hg clone ${KIIN_HOME}/sources/jshydra jshydra
    cd ../..
    python2 build.py build -r
}

kiin_install() {
    mkdir xpi
    mv adblockplus*.xpi xpi
    cd xpi
    unzip adblockplus*.xpi
    emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' install.rdf)
    mkdir -p ${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
    rm adblockplus*.xpi
    cp -r * ${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
    find ${pkgdir} -type d -exec chmod 0755 {} \;
    find ${pkgdir} -type f -exec chmod 0644 {} \;
}
