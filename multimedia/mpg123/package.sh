#!/bin/sh

pkgname=mpg123
pkgver=1.21.0
extension=bz2
folder="http://mpg123.orgis.org/download/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr \
      --disable-static
  else
    ./configure --prefix=/usr \
      --with-audio="alsa" \
      --with-cpu=i586 \
      --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
