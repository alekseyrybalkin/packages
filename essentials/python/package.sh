#!/bin/sh

pkgname=python
ARCH_NAME=python2
pkgver=2.7.7
extension=xz
folder="http://legacy.python.org/ftp/${pkgname}/"
check_server=1

srctar=Python-${pkgver}.tar.${extension}
srcdir=${location}/Python-${pkgver}

. ${KIIN_REPO}/defaults.sh

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
