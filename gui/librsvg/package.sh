#!/bin/sh

pkgname=librsvg
majorver=2.40
pkgver=${majorver}.1
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --disable-introspection
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  gdk-pixbuf-query-loaders --update-cache
}

kiin_after_upgrade() {
  kiin_after_install
}
