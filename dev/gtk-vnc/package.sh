#!/bin/sh

pkgname=gtk-vnc
pkgver=0.5.3
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --with-python \
    --with-examples \
    --disable-static \
    --without-sasl \
    --with-pulseaudio=no \
    --with-gtk=3.0
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
