#!/bin/sh

pkgname=python-pysdl2
pkgver=0.9.6
vcs=git
vcs_pkgname=py-sdl2
gittag=rel_${pkgver//\./_}
relmon_id=12950

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
