#!/bin/sh

pkgname=xorg-server
pkgver=1.13.0
urls="http://xorg.freedesktop.org/releases/individual/xserver/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

XORG_PREFIX="/usr"
XORG_CONFIG="--prefix=$XORG_PREFIX \
  --sysconfdir=/etc \
  --mandir=$XORG_PREFIX/share/man \
  --localstatedir=/var"

kiin_make() {
  sed -i -e 's/_INPUT_H/_UAPI_INPUT_H/g' hw/xfree86/common/xf86str.h
  ./configure $XORG_CONFIG \
    --with-xkb-output=/var/lib/xkb \
    --enable-install-setuid
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/etc/X11/xorg.conf.d
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
