#!/bin/sh

pkgname=python
pkgver=2.7.3
urls="http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
srctar=Python-${pkgver}.tar.xz
srcdir=${location}/Python-${pkgver}

kiin_make() {
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py
  sed -i "s/ndbm_libs = \[\]/ndbm_libs = ['gdbm', 'gdbm_compat']/" setup.py
  ./configure --prefix=/usr --enable-shared
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  chmod -v 755 ${pkgdir}/usr/lib/libpython2.7.so.1.0
  # docs anyone?
}
