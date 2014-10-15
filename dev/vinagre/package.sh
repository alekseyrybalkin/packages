#!/bin/sh

pkgname=vinagre
pkgver=3.14.1
urls="http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/$pkgname
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  glib-compile-schemas /usr/share/glib-2.0/schemas
  update-desktop-database -q
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
  update-mime-database usr/share/mime > /dev/null
}
kiin_after_upgrade() {
  kiin_after_install
}
