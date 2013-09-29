#!/bin/sh

pkgname=webkitgtk
pkgver=2.2.0
extension=xz
folder="http://webkitgtk.org/releases/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  sed -i '/generate-gtkdoc --rebase/s:^:# :' GNUmakefile.in
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/WebKitGTK \
    --disable-geolocation
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
