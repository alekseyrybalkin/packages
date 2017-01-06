#!/bin/sh

pkgname=python-kivy
pkgver=1.9.1
vcs=git
vcs_pkgname=kivy
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    USE_EGL=1 USE_MESAGL=1 USE_X11=1 python setup.py build build_ext --inplace
}

kiin_install() {
    USE_EGL=1 USE_MESAGL=1 USE_X11=1 python setup.py install --prefix=/usr --root=${pkgdir}
    rm "${pkgdir}/usr/share/kivy-examples/demo/showcase/data/screens/tabbedpanel + layouts.kv"
}
