#!/bin/sh

pkgname=audiofile
pkgver=0.3.5
urls="http://ftp.gnome.org/pub/gnome/sources/audiofile/0.3/audiofile-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
