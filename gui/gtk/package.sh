#!/bin/sh

pkgname=gtk
majorver=3.9
pkgver=${majorver}.10
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}+/"
check_server=1

srctar=${pkgname}+-${pkgver}.tar.${extension}
srcdir=${location}/${pkgname}+-${pkgver}

. ${KIIN_HOME}/defaults.sh

ver_grep="^${pkgname}\+-.*\.tar\.${extension}$"
ver_seds() {
  sed -r "s/^${pkgname}\+-//g" | sed -r "s/\.tar\.${extension}$//g"
}

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
