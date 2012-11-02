#!/bin/sh

pkgname=libxt
pkgver=1.1.3
urls="http://xorg.freedesktop.org/releases/individual/lib/libXt-${pkgver}.tar.bz2"
srctar=libXt-${pkgver}.tar.bz2
srcdir=${location}/libXt-${pkgver}
multilib=1

XORG_PREFIX="/usr"
XORG_CONFIG="--prefix=$XORG_PREFIX \
  --sysconfdir=/etc \
  --mandir=$XORG_PREFIX/share/man \
  --localstatedir=/var"

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure $XORG_CONFIG \
      --with-appdefaultdir=/etc/X11/app-defaults
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure $XORG_CONFIG --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf "${pkgdir}"/usr/{include,share,bin}
  fi
}
