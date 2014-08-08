#!/bin/sh

pkgname=evince
pkgver=3.12.1
urls="http://ftp.gnome.org/pub/gnome/sources/evince/3.12/evince-${pkgver}.tar.xz"
srctar=evince-${pkgver}.tar.xz
srcdir=${location}/evince-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/evince \
    --disable-introspection \
    --disable-nautilus \
    --without-keyring \
    --disable-dbus \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/share/help
}

kiin_after_install() {
  glib-compile-schemas /usr/share/glib-2.0/schemas
  update-desktop-database -q
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

kiin_after_upgrade() {
  kiin_after_install
}
