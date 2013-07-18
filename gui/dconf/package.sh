#!/bin/sh

pkgname=dconf
pkgver=0.16.1
urls="http://ftp.gnome.org/pub/gnome/sources/dconf/0.16/dconf-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/dconf
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
