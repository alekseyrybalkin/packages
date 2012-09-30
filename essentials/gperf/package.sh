#!/bin/sh

pkgname=gperf
pkgver=3.0.4
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --docdir=/usr/share/doc/${pkgname}-${pkgver}
  makeinfo -o doc/gperf.txt --plaintext doc/gperf.texi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -m644 -v doc/${pkgname}.{dvi,ps,pdf,txt} \
    ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
