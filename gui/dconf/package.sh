#!/bin/sh

pkgname=dconf
majorver=0.18
pkgver=${majorver}.0
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/dconf
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
