#!/bin/sh

pkgname=webkitgtk
pkgver=2.4.4
extension=xz
folder="http://webkitgtk.org/releases/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[0-9]\.[02468]\.[0-9]\.tar\.${extension}$"

kiin_make() {
  sed -i '/generate-gtkdoc --rebase/s:^:# :' GNUmakefile.in
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/WebKitGTK \
    --disable-geolocation
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}
