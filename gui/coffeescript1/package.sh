#!/bin/sh

pkgname=coffeescript1
pkgver=1.12.8
vcs=git
vcs_pkgname=coffeescript
gittag=${pkgver}

kiin_make() {
    rm -rf .git .gitignore
    cd ../
    cp -r coffeescript{1,}-${pkgver}
    tar cvf coffeescript-${pkgver}.tgz coffeescript-${pkgver}
    rm -rf coffeescript-${pkgver}
}

kiin_install() {
    cd ..
    npm install -g --user root --prefix ${pkgdir}/usr coffeescript-${pkgver}.tgz

    rm coffeescript-${pkgver}.tgz
}
