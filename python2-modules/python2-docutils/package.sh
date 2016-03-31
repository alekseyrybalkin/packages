#!/bin/sh

#vcs=subversion
pkgname=python2-docutils
ARCH_NAME=docutils
pkgver=0.12
urls="http://downloads.sourceforge.net/docutils/docutils-${pkgver}.tar.gz"
srctar=docutils-${pkgver}.tar.gz
srcdir=${location}/docutils-${pkgver}

kiin_make() {
  python2 setup.py build
  find . -type f -exec \
      sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

kiin_install() {
  python2 setup.py install --root=${pkgdir}
}
