#!/bin/sh

pkgname=python2-gtk
ARCH_NAME=pygtk
pkgver=2.24.0
urls="http://ftp.gnome.org/pub/gnome/sources/pygtk/${pkgver%.*}/pygtk-${pkgver}.tar.bz2"
srctar=pygtk-${pkgver}.tar.bz2
srcdir=${location}/pygtk-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
