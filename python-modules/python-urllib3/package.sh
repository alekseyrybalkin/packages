#!/bin/sh

pkgname=python-urllib3
pkgver=1.21.1
vcs=git
vcs_pkgname=urllib3
gittag=${pkgver}
relmon_id=4078

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
