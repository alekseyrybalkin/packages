#!/bin/sh

pkgname=subversion
pkgver=1.7.6
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -Np1 -i ../subversion-1.7.6-build_fixes-1.patch
  ./configure --prefix=/usr --with-apr=/usr --with-apr-util=/usr \
    --with-zlib=/usr --with-neon=/usr --with-sqlite=/usr
  make external-all
  make LT_LDFLAGS="-L$Fdestdir/usr/lib" local-all
  make swig-py swig-pl
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/subversion-1.7.6
  cp -v -R doc/* ${pkgdir}/usr/share/doc/subversion-1.7.6
  make DESTDIR=${pkgdir} install-swig-pl
  make DESTDIR=${pkgdir} install-swig-py
}
