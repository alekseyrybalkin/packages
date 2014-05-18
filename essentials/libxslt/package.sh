#!/bin/sh

pkgname=libxslt
ARCH_NAME_LIB32=libxslt
pkgver=1.1.28
extension=gz
folder="http://xmlsoft.org/sources/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    ./configure --prefix=/usr --disable-static --libdir=${LIBDIR}
  else
    ./configure --prefix=/usr --disable-static --libdir=${LIBDIR} --with-python=/tmp
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
