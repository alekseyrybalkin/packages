#!/bin/sh

#vcs=none
pkgname=xlockmore
pkgver=5.46
urls="http://www.tux.org/~bagleyd/xlock/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's/\*8x16\*/-\*-ubuntu-medium-r-\*-\*-24-\*-\*-\*-\*-\*-\*/g' xlock/XLock.ad
  sed -i -e 's/helvetica/ubuntu/g' modes/*.c modes/glx/*.c xlock/*.c xglock/xglockrc
  sed -i -e 's/fixed-medium/ubuntu-medium/g' xlock/*.c
  ./configure --prefix=/usr \
    --enable-appdefaultdir=/usr/share/X11/app-defaults \
    --without-esound \
    --without-gtk \
    --without-gtk2 \
    --without-ftgl
  make
}

kiin_install() {
  make xapploaddir=${pkgdir}/usr/share/X11/app-defaults \
    mandir=${pkgdir}/usr/man/man1 \
    prefix=${pkgdir}/usr install
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share/
}
