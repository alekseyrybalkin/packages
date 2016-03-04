#!/bin/sh

pkgname=libxml2
pkgver=2.9.3
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://xmlsoft.org/sources/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    ./autogen.sh --prefix=/usr --disable-static --with-history --libdir=${LIBDIR}
  else
    ./autogen.sh --prefix=/usr --disable-static --with-history --with-python=/tmp --libdir=${LIBDIR}
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
