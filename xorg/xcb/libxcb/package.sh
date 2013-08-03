#!/bin/sh

pkgname=libxcb
pkgver=1.9.1
urls="http://xcb.freedesktop.org/dist/${pkgname}-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/libxcb-${pkgver}-automake_bug-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../libxcb-${pkgver}-automake_bug-1.patch
  sed -e "s/pthread-stubs//" -i configure.ac
  autoreconf -fi
  ./configure $XORG_CONFIG \
    --enable-xinput --enable-xkb \
    --docdir='${datadir}'/doc/${pkgname} \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
