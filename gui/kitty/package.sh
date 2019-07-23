#!/bin/sh

pkgname=kitty
pkgver=0.14.2
vcs=git
gittag=v${pkgver}
relmon_id=17405

kiin_make() {
    python setup.py linux-package --update-check-interval=0
}

kiin_install() {
    cp -r linux-package ${pkgdir}/usr
}
