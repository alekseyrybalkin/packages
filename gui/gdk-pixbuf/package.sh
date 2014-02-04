#!/bin/sh

pkgname=gdk-pixbuf
ARCH_NAME=gdk-pixbuf2
majorver=2.30
pkgver=${majorver}.4
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  ./configure --prefix=/usr --with-x11 --libdir=$LIBDIR
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

known="usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
