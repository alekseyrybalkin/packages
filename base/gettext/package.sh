#!/bin/sh

pkgname=gettext
pkgver=0.18.1.1
urls="http://ftp.gnu.org/gnu/gettext/gettext-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' gettext-*/*/stdio.in.h
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr \
                --docdir=/usr/share/doc/gettext-${pkgver} \
                --with-included-libxml \
                --without-git
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --prefix=/usr \
      --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf ${pkgdir}/usr/{include,share,bin}
  fi
}
