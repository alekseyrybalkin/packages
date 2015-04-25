#!/bin/sh

pkgname=cpio
pkgver=2.11
urls="http://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' gnu/stdio.in.h
  ./configure --prefix=/usr     \
              --libexecdir=/tmp \
              --enable-mt       \
              --with-rmt=/usr/bin/rmt
  make
  makeinfo --html            -o doc/html      doc/cpio.texi
  makeinfo --html --no-split -o doc/cpio.html doc/cpio.texi
  makeinfo --plaintext       -o doc/cpio.txt  doc/cpio.texi
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/cpio-${pkgver}/html
  install -v -m644    doc/html/* \
                      ${pkgdir}/usr/share/doc/cpio-${pkgver}/html
  install -v -m644    doc/cpio.{html,txt} \
                      ${pkgdir}/usr/share/doc/cpio-${pkgver}
  # remove /tmp dir, it is created by filesystem package
  rm -r ${pkgdir}/tmp
}
