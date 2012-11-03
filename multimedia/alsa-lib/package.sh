#!/bin/sh

pkgname=alsa-lib
pkgver=1.0.26
urls="http://gentoo.nixsolutions.com/distfiles/alsa-lib-1.0.26.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure
  else
    export CC="gcc -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --libdir=/usr/lib32 --disable-python
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf ${pkgdir}/usr/{include,share,bin}
  fi
}
