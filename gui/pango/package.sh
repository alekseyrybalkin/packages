#!/bin/sh

pkgname=pango
majorver=1.36
pkgver=${majorver}.2
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

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

known="usr/lib/pango/1.8.0/modules.cache"
