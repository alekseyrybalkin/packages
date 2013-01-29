#!/bin/sh

pkgname=xorg-server
pkgver=1.13.2
urls="http://xorg.freedesktop.org/releases/individual/xserver/${pkgname}-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/xorg-server-${pkgver}-use_pixman_glyph_cache-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../xorg-server-${pkgver}-use_pixman_glyph_cache-1.patch
  ./configure $XORG_CONFIG \
    --with-xkb-output=/var/lib/xkb \
    --enable-install-setuid \
    --with-sha1=libcrypto
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/etc/X11/xorg.conf.d
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
