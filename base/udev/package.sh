#!/bin/sh

pkgname=udev
pkgver=208
udev_lfs_ver=1
urls="http://anduin.linuxfromscratch.org/sources/other/udev-lfs-${pkgver}-${udev_lfs_ver}.tar.bz2 \
  http://www.freedesktop.org/software/systemd/systemd-${pkgver}.tar.xz"
srctar=systemd-${pkgver}.tar.xz
srcdir=${location}/systemd-${pkgver}

kiin_make() {
  MAKEFLAGS=
  tar -xvf ${KIIN_HOME}/tarballs/udev-lfs-${pkgver}-${udev_lfs_ver}.tar.bz2
  make -f udev-lfs-${pkgver}-${udev_lfs_ver}/Makefile.lfs
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} -f udev-lfs-${pkgver}-${udev_lfs_ver}/Makefile.lfs install
  mv ${pkgdir}/{sbin,usr/bin}
  mv ${pkgdir}/{lib/udev,usr/lib}
  rm -rf ${pkgdir}/{,usr/}lib/firmware
  mv ${pkgdir}/lib/* ${pkgdir}/usr/lib
  rmdir ${pkgdir}/lib
  rm ${pkgdir}/usr/lib/libudev.so
  ln -sv `readlink ${pkgdir}/usr/lib/libudev.so.*` \
    ${pkgdir}/usr/lib/libudev.so
}

kiin_after_install() {
  udevadm hwdb --update
}

kiin_after_upgrade() {
  kiin_after_install
}
