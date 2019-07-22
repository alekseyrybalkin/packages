#!/bin/sh

pkgname=python-youtube-dl
ARCH_NAME=youtube-dl
pkgver=2019.06.21
vcs=git
vcs_pkgname=youtube-dl
gittag=${pkgver}
relmon_id=5292

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
    rm -rf ${pkgdir}/usr/etc
}
