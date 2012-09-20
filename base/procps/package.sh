#!/bin/sh

pkgname=procps
pkgver=3.2.8
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../procps-3.2.8-fix_HZ_errors-1.patch
  patch -Np1 -i ../procps-3.2.8-watch_unicode-1.patch
  sed -i -e 's@\*/module.mk@proc/module.mk ps/module.mk@' Makefile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} ldconfig=/bin/true install
}
