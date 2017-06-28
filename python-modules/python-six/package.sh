#!/bin/sh

pkgname=python-six
pkgver=1.10.0
vcs=git
vcs_pkgname=six
gittag=${pkgver}
relmon_id=4027

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
