#!/bin/sh

pkgname=udev
pkgver=195
urls="http://anduin.linuxfromscratch.org/sources/other/udev-lfs-${pkgver}.tar.bz2 \
  http://www.freedesktop.org/software/systemd/systemd-${pkgver}.tar.xz"
srctar=systemd-${pkgver}.tar.xz
srcdir=${location}/systemd-${pkgver}

kiin_make() {
  MAKEFLAGS=
  tar -xvf ../udev-lfs-${pkgver}.tar.bz2
  make -f udev-lfs-${pkgver}/Makefile.lfs
}

kiin_install() {
  make DESTDIR=${pkgdir} -f udev-lfs-${pkgver}/Makefile.lfs install
}
