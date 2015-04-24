#!/bin/sh

pkgname=perl
pkgver=5.20.2
urls="http://www.cpan.org/src/5.0/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../perl-${pkgver}-gcc5_fixes-1.patch
  export BUILD_ZLIB=False
  export BUILD_BZIP2=0
  sh Configure -des -Dprefix=/usr                 \
    -Dvendorprefix=/usr           \
    -Dman1dir=/usr/share/man/man1 \
    -Dman3dir=/usr/share/man/man3 \
    -Dpager="/usr/bin/less -isR"  \
    -Duseshrplib
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
