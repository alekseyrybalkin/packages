#!/bin/sh

pkgname=at-spi2-core
majorver=2.9
pkgver=${majorver}.4
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/at-spi2-core
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
