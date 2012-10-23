#!/bin/sh

pkgname=busybox-small
pkgver=1.20.2
urls="http://www.busybox.net/downloads/busybox-${pkgver}.tar.bz2"
srctar=busybox-${pkgver}.tar.bz2
srcdir=${location}/busybox-${pkgver}

kiin_make() {
  cp ../config .config
  sed '1,1i#include <sys/resource.h>' -i include/libbb.h
  make
}

kiin_install() {
  mkdir ${pkgdir}/bin
  cp busybox ${pkgdir}/bin/${pkgname}
}
