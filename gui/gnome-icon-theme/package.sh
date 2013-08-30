#!/bin/sh

pkgname=gnome-icon-theme
pkgver=3.8.3
urls="http://ftp.gnome.org/pub/gnome/sources/gnome-icon-theme/3.8/gnome-icon-theme-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/gnome
}

kiin_after_upgrade() {
  kiin_after_install
}
