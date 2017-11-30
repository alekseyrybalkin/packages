#!/bin/sh

pkgname=python-et-xmlfile
pkgver=1.0.1
vcs=mercurial
vcs_pkgname=et_xmlfile
hgtag=${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
