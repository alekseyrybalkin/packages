#!/bin/sh

pkgname=udev
pkgver=196
urls="http://anduin.linuxfromscratch.org/sources/other/udev-lfs-${pkgver}.tar.bz2 \
  http://www.freedesktop.org/software/systemd/systemd-${pkgver}.tar.xz"
srctar=systemd-${pkgver}.tar.xz
srcdir=${location}/systemd-${pkgver}

kiin_make() {
  MAKEFLAGS=
  tar -xvf ../udev-lfs-${pkgver}.tar.bz2
  sed -i -e 's/HAVE___SECURE_GETENV/HAVE_SECURE_GETENV/' udev-lfs-${pkgver}/cfg.h
  sed -i -e '/udevadm hwdb/d' udev-lfs-${pkgver}/Makefile.lfs
  sed -i -e 's/create/update/' src/udev/udevadm-hwdb.c
  make -f udev-lfs-${pkgver}/Makefile.lfs
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} -f udev-lfs-${pkgver}/Makefile.lfs install
}

kiin_after_install() {
  udevadm hwdb --update
}

kiin_after_upgrade() {
  kiin_after_install
}
