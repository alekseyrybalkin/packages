#!/bin/sh

pkgname=dbus-glib
pkgver=0.102
urls="http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --localstatedir=/var --libexecdir=/usr/lib/dbus-glib
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
