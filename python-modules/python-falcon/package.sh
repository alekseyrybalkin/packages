#!/bin/sh

pkgname=python-falcon
SKIP_ARCH_CHECK=1
pkgver=1.4.1
vcs=git
vcs_pkgname=falcon
gittag=${pkgver}
relmon_id=3860

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
