#!/bin/sh

pkgname=procps
pkgver=3.2.8
urls="http://procps.sourceforge.net/procps-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/lfs/development/procps-${pkgver}-fix_HZ_errors-1.patch \
  http://www.linuxfromscratch.org/patches/lfs/development/procps-${pkgver}-watch_unicode-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../procps-${pkgver}-fix_HZ_errors-1.patch
  patch -Np1 -i ../procps-${pkgver}-watch_unicode-1.patch
  sed -i -e 's@\*/module.mk@proc/module.mk ps/module.mk@' Makefile
  sed -i -e 's/^#SKIP/SKIP/g' Makefile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} ldconfig=/bin/true install
}
