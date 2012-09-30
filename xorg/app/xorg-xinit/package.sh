#!/bin/sh

_pkgname=xinit
pkgname=xorg-${_pkgname}
pkgver=1.3.2
urls="http://xorg.freedesktop.org/releases/individual/app/${_pkgname}-${pkgver}.tar.bz2"
srctar=${_pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${_pkgname}-${pkgver}

XORG_PREFIX="/usr"
XORG_CONFIG="--prefix=$XORG_PREFIX \
  --sysconfdir=/etc \
  --mandir=$XORG_PREFIX/share/man \
  --localstatedir=/var"

kiin_make() {
  ./configure $XORG_CONFIG \
    --with-xinitdir=/etc/X11/app-defaults
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
