#!/bin/sh

pkgname=python-openpyxl
pkgver=2.6.2
vcs=mercurial
vcs_pkgname=openpyxl
hgtag=${pkgver}
# beta versions
#relmon_id=8098

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
