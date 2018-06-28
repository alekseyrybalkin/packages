#!/bin/sh

pkgname=python-opengl
ARCH_NAME=pyopengl
pkgver=3.1.0
vcs=bzr
vcs_pkgname=pyopengl
bzrtag=release-${pkgver}
relmon_id=3754

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
