#!/bin/sh

pkgname=python-babel
pkgver=2.3.4
vcs=git
git_pkgname=babel
gittag=${pkgver}
extra_urls="http://unicode.org/Public/cldr/28/core.zip"
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    cp ${KIIN_HOME}/tarballs/core.zip ./cldr/core-28.zip
    python setup.py import_cldr
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
