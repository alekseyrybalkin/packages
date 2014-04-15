#!/bin/sh

pkgname=glib-networking
majorver=2.40
pkgver=${majorver}.1
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/glib-networking \
    --with-ca-certificates=/etc/ssl/ca-bundle.crt \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/files
}
