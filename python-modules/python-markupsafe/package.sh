#!/bin/sh

pkgname=python-markupsafe
pkgver=1.1.1
vcs=git
vcs_pkgname=markupsafe
gittag=${pkgver}
urls="http://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-${pkgver}.tar.gz"
srctar=MarkupSafe-${pkgver}.tar.gz
relmon_id=3918

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
