#!/bin/sh

pkgname=gtk
pkgver=3.9.2
urls="http://ftp.gnome.org/pub/gnome/sources/gtk+/3.9/gtk+-${pkgver}.tar.xz"
srctar=${pkgname}+-${pkgver}.tar.xz
srcdir=${location}/${pkgname}+-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk2-dependency
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # fix conflict with gtk2
  rm ${pkgdir}/usr/share/man/man1/gtk-update-icon-cache.1
}

kiin_after_install() {
  gtk-query-immodules-3.0 --update-cache
  glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
  kiin_after_install
}
