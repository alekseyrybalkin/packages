#!/bin/sh

pkgname=python-pytest-runner
pkgver=2.11.1
vcs=git
vcs_pkgname=pytest-runner
gittag=${pkgver}
relmon_id=11466

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
