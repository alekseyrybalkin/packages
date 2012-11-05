#!/bin/sh

pkgname=tidyhtml
pkgver=20101110
urls="http://anduin.linuxfromscratch.org/sources/BLFS/svn/t/tidy-cvs_${pkgver}.tar.bz2"
srctar=tidy-cvs_${pkgver}.tar.bz2
srcdir=${location}/tidy-cvs_${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -v -m644 -D htmldoc/tidy.1 \
    ${pkgdir}/usr/share/man/man1/tidy.1
  install -v -m755 -d ${pkgdir}/usr/share/doc/tidy-cvs_20101110
  install -v -m644    htmldoc/*.{html,gif,css} \
    ${pkgdir}/usr/share/doc/tidy-cvs_20101110
}
