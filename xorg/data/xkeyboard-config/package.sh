#!/bin/sh

pkgname=xkeyboard-config
pkgver=2.7
urls="http://xorg.freedesktop.org/releases/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

XORG_PREFIX="/usr"
XORG_CONFIG="--prefix=$XORG_PREFIX \
  --sysconfdir=/etc \
  --mandir=$XORG_PREFIX/share/man \
  --localstatedir=/var"

kiin_make() {
  ./configure $XORG_CONFIG --with-xkb-rules-symlink=xorg
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -dv -m755 ${pkgdir}$XORG_PREFIX/share/doc/${pkgname}-${pkgver}
  install -v -m644 docs/{README,HOWTO}* \
    ${pkgdir}$XORG_PREFIX/share/doc/${pkgname}-${pkgver}
}
