#!/bin/sh

pkgname=udev
pkgver=189
srctar=systemd-${pkgver}.tar.xz
srcdir=${location}/systemd-${pkgver}

kiin_make() {
  MAKEFLAGS=
  tar -xvf ../udev-lfs-189.tar.bz2
  make -f udev-lfs-189/Makefile.lfs
}

kiin_install() {
  make DESTDIR=${pkgdir} -f udev-lfs-189/Makefile.lfs install
  #bash udev-lfs-189/init-net-rules.sh
}
