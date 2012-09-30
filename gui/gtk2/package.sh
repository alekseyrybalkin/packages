#!/bin/sh

pkgname=gtk2
pkgver=2.24.13
urls="http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz"
srctar=gtk+-${pkgver}.tar.xz
srcdir=${location}/gtk+-${pkgver}

kiin_make() {
  sed -i 's#l \(gtk-.*\).sgml#& -o \1#' docs/{faq,tutorial}/Makefile.in
  sed -i 's#.*@man_#man_#' docs/reference/gtk/Makefile.in
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # AFTER INSTALL: gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
}
