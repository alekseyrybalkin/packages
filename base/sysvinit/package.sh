#!/bin/sh

pkgname=sysvinit
pkgver=2.88dsf
urls="http://download.savannah.gnu.org/releases/sysvinit/sysvinit-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/lfs/development/sysvinit-${pkgver}-consolidated-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../sysvinit-${pkgver}-consolidated-1.patch
  make -C src
}

kiin_install() {
  make ROOT=${pkgdir} -C src install
  mv ${pkgdir}/{sbin,usr/bin}
}
