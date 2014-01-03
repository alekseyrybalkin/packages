#!/bin/sh

pkgname=hicolor-icon-theme
pkgver=0.12
urls="http://icon-theme.freedesktop.org/releases/hicolor-icon-theme-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

known="usr/share/icons/hicolor/icon-theme.cache"
