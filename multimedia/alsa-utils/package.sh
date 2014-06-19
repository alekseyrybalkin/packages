#!/bin/sh

pkgname=alsa-utils
pkgver=1.0.28
urls="ftp://ftp.alsa-project.org/pub/utils/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --disable-alsaconf --disable-xmlto \
    --without-systemdsystemunitdir --sbindir=/usr/bin \
    --with-udev-rules-dir=/usr/lib/udev/rules.d
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
