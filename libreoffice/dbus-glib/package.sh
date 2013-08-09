#!/bin/sh

pkgname=dbus-glib
pkgver=0.100.2
urls=" http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/dbus-1.0 \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
