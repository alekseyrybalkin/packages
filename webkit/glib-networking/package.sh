#!/bin/sh

pkgname=glib-networking
majorver=2.37
pkgver=${majorver}.5
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/glib-networking \
    --with-ca-certificates=/etc/ssl/ca-bundle.crt \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
