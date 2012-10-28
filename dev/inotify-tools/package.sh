#!/bin/sh

pkgname=inotify-tools
pkgver=3.14
urls="http://github.com/downloads/rvoicilas/inotify-tools/inotify-tools-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
