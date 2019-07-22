#!/bin/sh

pkgname=python-mako
pkgver=1.0.12
vcs=git
vcs_pkgname=mako
gittag=rel_${pkgver//\./_}
relmon_id=3915

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
