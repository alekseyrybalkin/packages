#!/bin/sh

pkgname=python-ptyprocess
pkgver=0.5.2
vcs=git
vcs_pkgname=ptyprocess
gittag=${pkgver}
relmon_id=6447

undead_make() {
    cp ../setup.py .
}

undead_install() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=0
}
