#!/bin/sh

pkgname=evince
pkgver=2.32.0
urls="http://ftp.acc.umu.se/pub/gnome/sources/evince/2.32/evince-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../update-poppler.patch
  sed -i -e '/^.*gnome-icon-theme.*$/d' configure
  sed -i -e '/^.*gnome-icon-theme.*$/d' configure.ac
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/evince \
    --disable-static \
    --disable-tests \
    --disable-nautilus \
    --without-keyring \
    --disable-dbus \
    --disable-schemas-compile \
    --without-gconf \
    --disable-scrollkeeper \
    --disable-help
  make LIBS=-lICE
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
