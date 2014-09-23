#!/bin/sh

pkgname=gtk
ARCH_NAME=gtk3
majorver=3.14
pkgver=${majorver}.0
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}+/"
check_server=1

srctar=${pkgname}+-${pkgver}.tar.${extension}
srcdir=${location}/${pkgname}+-${pkgver}

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"
ver_grep="^${pkgname}\+-.*\.tar\.${extension}$"
ver_seds() {
  sed -r "s/^${pkgname}\+-//g" | sed -r "s/\.tar\.${extension}$//g"
}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-wayland-backend \
    --enable-x11-backend
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  gtk-query-immodules-3.0 --update-cache
  glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
  kiin_after_install
}

known="usr/lib/gtk-3.0/3.0.0/immodules.cache"
