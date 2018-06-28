#!/bin/sh

pkgname=python-lxml
pkgver=4.2.1
vcs=git
vcs_pkgname=lxml
gittag=lxml-${pkgver}
relmon_id=3914

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
