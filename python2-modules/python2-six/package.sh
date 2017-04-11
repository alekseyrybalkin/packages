#!/bin/sh

pkgname=python2-six
ARCH_NAME=python-six
pkgver=1.10.0
vcs=git
vcs_pkgname=six
gittag=c3ec058bf8c4d6329224eac53366c8e9ce511417

kiin_make() {
  python2 setup.py build
}

kiin_install() {
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
