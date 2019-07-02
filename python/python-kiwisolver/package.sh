#!/bin/sh

pkgname=python-kiwisolver
pkgver=1.1.0
vcs=git
vcs_pkgname=kiwi
gittag=${pkgver}
relmon_id=16910

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
