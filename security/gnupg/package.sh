#!/bin/sh

pkgname=gnupg
pkgver=1.4.14
urls="ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/gnupg-${pkgver}
  mv -v ${pkgdir}/usr/share/gnupg/FAQ ${pkgdir}/usr/share/doc/gnupg-${pkgver}
  install -v -m644 \
    doc/{highlights-1.4.txt,OpenPGP,samplekeys.asc,DETAILS,*.texi} \
    ${pkgdir}/usr/share/doc/gnupg-${pkgver}
}
