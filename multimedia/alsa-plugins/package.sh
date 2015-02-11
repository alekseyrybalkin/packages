#!/bin/sh

pkgname=alsa-plugins
pkgver=1.0.28
urls="ftp://ftp.alsa-project.org/pub/plugins/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i "/speex_preprocess/i#include <stdint.h>" speex/pcm_speex.c
  if [ -z "${KIIN_LIB32}" ]; then
    ./configure --libdir=${LIBDIR}
  else
    ./configure --libdir=${LIBDIR} --disable-avcodec
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
