#!/bin/sh

pkgname=slang
majorver=2.2
pkgver=${majorver}.4
extension=bz2
major_folder="ftp://space.mit.edu/pub/davis/slang/"
check_server=1

. ${KIIN_HOME}/defaults.sh

folder="${major_folder}v${majorver}/"
urls="${folder}${srctar}"
majorver_grep="^v[0-9]+\.[0-9]+/?$"
majorver_seds() {
  sed -r "s/\///g" | sed -r "s/^v//g"
}

kiin_make() {
  MAKEFLAGS=
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-png
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install-all
}
