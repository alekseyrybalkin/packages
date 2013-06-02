#!/bin/sh

pkgname=glib-networking
pkgver=2.37.2
urls="http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.37/glib-networking-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

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
