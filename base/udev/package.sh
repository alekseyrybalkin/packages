#!/bin/sh

pkgname=udev
pkgver=206
udev_lfs_ver=1
urls="http://anduin.linuxfromscratch.org/sources/other/udev-lfs-${pkgver}-${udev_lfs_ver}.tar.bz2 \
  http://www.freedesktop.org/software/systemd/systemd-${pkgver}.tar.xz"
srctar=systemd-${pkgver}.tar.xz
srcdir=${location}/systemd-${pkgver}

kiin_make() {
  MAKEFLAGS=
  tar -xvf ../udev-lfs-${pkgver}-${udev_lfs_ver}.tar.bz2
  make -f udev-lfs-${pkgver}-${udev_lfs_ver}/Makefile.lfs
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} -f udev-lfs-${pkgver}-${udev_lfs_ver}/Makefile.lfs install
}

kiin_after_install() {
  udevadm hwdb --update
}

kiin_after_upgrade() {
  kiin_after_install
}
