#!/bin/sh

pkgname=libdrm
pkgver=2.4.55
urls="http://dri.freedesktop.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -e "/pthread-stubs/d" -i configure.ac
  autoreconf --force --install
  ./configure --prefix=$XORG_PREFIX \
    --enable-udev \
    --disable-cairo-tests \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
