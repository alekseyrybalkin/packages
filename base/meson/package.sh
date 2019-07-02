#!/bin/sh

pkgname=meson
pkgver=0.51.0
vcs=git
gittag=${pkgver}
relmon_id=6472

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
