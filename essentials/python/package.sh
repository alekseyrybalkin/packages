#!/bin/sh

pkgname=python
pkgver=2.7.5
extension=xz
folder="http://www.python.org/ftp/${pkgname}/"
check_server=1

srctar=Python-${pkgver}.tar.${extension}
srcdir=${location}/Python-${pkgver}

. ${KIIN_HOME}/defaults.sh

urls="${folder}${pkgver}/${srctar}"
ver_grep="^2\.[0-9]+\.[0-9]+/$"
ver_seds() {
  sed -r "s/\///g"
}

kiin_make() {
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py
  ./configure --prefix=/usr \
    --enable-shared \
    --with-system-expat \
    --with-system-ffi \
    --enable-unicode=ucs4
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  chmod -v 755 ${pkgdir}/usr/lib/libpython2.7.so.1.0
  # docs anyone?
}
