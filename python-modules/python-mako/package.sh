#!/bin/sh

pkgname=python-mako
pkgver=1.0.6
vcs=git
vcs_pkgname=mako
gittag=rel_${pkgver//\./_}
urls="https://pypi.python.org/packages/source/M/Mako/Mako-${pkgver}.tar.gz"
srctar=Mako-${pkgver}.tar.gz
srcdir=${location}/Mako-${pkgver}
relmon_id=3915

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
