#!/bin/sh

pkgname=at-spi2-core
majorver=2.14
pkgver=${majorver}.1
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/at-spi2-core
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
