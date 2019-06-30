#!/bin/sh

pkgname=python-imagesize
pkgver=1.1.0
vcs=git
vcs_pkgname=imagesize_py
gittag=${pkgver}
relmon_id=10626

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
