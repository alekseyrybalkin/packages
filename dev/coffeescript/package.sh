#!/bin/sh

pkgname=coffeescript
pkgver=1.12.7
vcs=git
gittag=${pkgver}
relmon_id=8045

kiin_make() {
    rm -rf .git .gitignore
    cd ../
    tar cvf ${pkgname}-${pkgver}.tgz ${pkgname}-${pkgver}
}

kiin_install() {
    npm install -g --user root --prefix ${pkgdir}/usr ${srcdir}/../${pkgname}-${pkgver}.tgz
    rm -r ${pkgdir}/usr/etc
}