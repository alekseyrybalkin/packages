#!/bin/sh

pkgname=python-youtube-dl
ARCH_NAME=youtube-dl
pkgver=2016.06.27
vcs=git
vcs_pkgname=youtube-dl
gittag=${pkgver}
urls="http://youtube-dl.org/downloads/${pkgver}/youtube-dl-${pkgver}.tar.gz"
srctar=youtube-dl-${pkgver}.tar.gz
srcdir=${location}/youtube-dl

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
    rm -rf ${pkgdir}/usr/etc
}
