#!/bin/sh

pkgname=shadow
pkgver=4.1.5.1
urls="http://pkg-shadow.alioth.debian.org/releases/shadow-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/groups$(EXEEXT) //' src/Makefile.in
  find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
  sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
        -e 's@/var/spool/mail@/var/mail@' etc/login.defs
  ./configure --sysconfdir=/etc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/passwd ${pkgdir}/bin
  sed -i 's/yes/no/' ${pkgdir}/etc/default/useradd
}

kiin_after_install() {
  pwconv
  grpconv
}
