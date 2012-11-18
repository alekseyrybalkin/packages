#!/bin/sh

pkgname=expat
pkgver=2.1.0
urls="http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr
  else
    export CC="gcc -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --prefix=/usr --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    install -v -m755 -d ${pkgdir}/usr/share/doc/expat-${pkgver}
    install -v -m644 doc/*.{html,png,css} ${pkgdir}/usr/share/doc/expat-${pkgver}
  else
    rm -rf ${pkgdir}/usr/{include,share,bin}
  fi
}
