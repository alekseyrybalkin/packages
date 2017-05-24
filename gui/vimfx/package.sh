#!/bin/sh

pkgname=vimfx
pkgver=0.20.10
vcs=git
gittag=v${pkgver}

kiin_make() {
    rm -rf ~/.npm
    cp -r /var/lib/kiin/tarballs/npm ~/.npm
    npm install
    npm run gulp -- xpi
}

kiin_install() {
    mkdir xpi
    mv build/VimFx.xpi xpi
    cd xpi
    unzip ./VimFx.xpi
    emid=`cat install.rdf | grep "em:id>{" | sed 's/.*<em:id>//g' | sed 's/<\/em:id>//g'`
    mkdir -p ${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
    rm VimFx.xpi
    cp -r * ${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
    find ${pkgdir} -type d -exec chmod 0755 {} \;
    find ${pkgdir} -type f -exec chmod 0644 {} \;
}
