#!/bin/sh

pkgname=zip
pkgver=3.0
urls="http://downloads.sourceforge.net/infozip/zip30.tar.gz"
srctar=zip30.tar.gz
srcdir=${location}/zip30

kiin_make() {
  make -f unix/Makefile generic_gcc
}

kiin_install() {
  make prefix=${pkgdir}/usr -f unix/Makefile install
}
