#!/bin/sh

pkgname=python-lxml
pkgver=4.1.1
vcs=git
vcs_pkgname=lxml
gittag=lxml-${pkgver}
relmon_id=3914

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
