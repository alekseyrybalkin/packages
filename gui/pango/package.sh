#!/bin/sh

pkgname=pango
majorver=1.35
pkgver=${majorver}.0
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  pango-querymodules --update-cache
}

kiin_after_upgrade() {
  kiin_after_install
}
