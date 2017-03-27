#!/bin/sh

pkgname=python-babel
pkgver=2.4.0
vcs=git
vcs_pkgname=babel
gittag=v${pkgver}
extra_urls="http://unicode.org/Public/cldr/29/core.zip"
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    cp ${KIIN_HOME}/tarballs/core.zip ./cldr/core-29.zip
    python setup.py import_cldr
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
