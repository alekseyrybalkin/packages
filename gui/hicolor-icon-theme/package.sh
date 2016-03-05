#!/bin/sh

pkgname=hicolor-icon-theme
pkgver=0.15
urls="http://icon-theme.freedesktop.org/releases/hicolor-icon-theme-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

known="usr/share/icons/hicolor/icon-theme.cache"
