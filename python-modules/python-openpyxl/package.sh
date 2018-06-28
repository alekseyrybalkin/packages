#!/bin/sh

pkgname=python-openpyxl
pkgver=2.5.1
vcs=mercurial
vcs_pkgname=openpyxl
hgtag=${pkgver}
# beta versions
#relmon_id=8098

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
