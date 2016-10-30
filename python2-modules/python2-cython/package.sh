#!/bin/sh

pkgname=python2-cython
ARCH_NAME=cython
pkgver=0.25.1
vcs=git
vcs_pkgname=cython
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --root=${pkgdir}
    mv ${pkgdir}/usr/bin/cygdb ${pkgdir}/usr/bin/cygdb2
    mv ${pkgdir}/usr/bin/cython ${pkgdir}/usr/bin/cython2
    mv ${pkgdir}/usr/bin/cythonize ${pkgdir}/usr/bin/cythonize2
}
