#!/bin/sh

pkgname=python-opengl
ARCH_NAME=pyopengl
pkgver=3.1.0
vcs=bzr
vcs_pkgname=pyopengl
bzrtag=release-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}
# alpha versions
#relmon_id=3754

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
