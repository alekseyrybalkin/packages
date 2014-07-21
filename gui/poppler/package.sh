#!/bin/sh

pkgname=poppler
vcs="git"
gittag=poppler-0.26.3
pkgver=0.26.3
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
