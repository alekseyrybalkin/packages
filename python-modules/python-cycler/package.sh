#!/bin/sh

pkgname=python-cycler
pkgver=0.10.0
vcs=git
vcs_pkgname=cycler
gittag=v${pkgver}
relmon_id=11552

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
