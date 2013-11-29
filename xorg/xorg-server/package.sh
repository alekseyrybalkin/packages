#!/bin/sh

pkgname=xorg-server
pkgver=1.14.4
urls="http://xorg.freedesktop.org/releases/individual/xserver/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG \
    --with-xkb-output=/var/lib/xkb \
    --enable-install-setuid \
    --with-sha1=libcrypto \
    --with-fontrootdir=/usr/share/fonts
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/etc/X11/xorg.conf.d
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
