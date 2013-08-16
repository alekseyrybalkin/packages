#!/bin/sh

pkgname=poppler
vcs="git"
gittag=31947d413eae115acc147c33fc55b8ab4adccd91
pkgver=0.24.0+
srcdir=${location}/poppler-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr     \
              --sysconfdir=/etc \
              --enable-zlib     \
              --disable-static  \
              --enable-xpdf-headers \
              --disable-poppler-qt4
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
