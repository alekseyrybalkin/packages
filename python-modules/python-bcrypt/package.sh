#!/bin/sh

pkgname=python-bcrypt
pkgver=2.0.0
vcs=git
git_pkgname=bcrypt
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "ffi.compile()" >> src/build_bcrypt.py
  python setup.py build
  cd src
  python build_bcrypt.py
}

kiin_install() {
  python setup.py install --prefix=/usr --root=${pkgdir}
  cp src/*.so ${pkgdir}/usr/lib/python3*/site-packages/bcrypt/
}
