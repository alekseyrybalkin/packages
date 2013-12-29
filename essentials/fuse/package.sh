#!/bin/sh

pkgname=fuse
pkgver=2.9.3
urls="http://downloads.sourceforge.net/fuse/fuse-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --libdir=/usr/lib \
    --enable-lib \
    --enable-util \
    --with-gnu-ld \
    INIT_D_PATH=/tmp/init.d
    #--extra-ldflags=-ldl \
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/sbin/* ${pkgdir}/usr/bin
  rm -rf ${pkgdir}/sbin
  mkdir -p ${pkgdir}/lib
  mv -v ${pkgdir}/usr/lib/libfuse.so.* ${pkgdir}/lib
  ln -sfv ../../lib/libfuse.so.${pkgver} ${pkgdir}/usr/lib/libfuse.so
  rm -rf ${pkgdir}/tmp/init.d
  rm -rf ${pkgdir}/dev
  rm -rf ${pkgdir}/tmp
}
