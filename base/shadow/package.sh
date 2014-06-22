#!/bin/sh

pkgname=shadow
pkgver=4.2.1
urls="http://pkg-shadow.alioth.debian.org/releases/shadow-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/groups$(EXEEXT) //' src/Makefile.in
  find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
  sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
        -e 's@/var/spool/mail@/var/mail@' etc/login.defs
  ./configure --sysconfdir=/etc --with-attr=no --bindir=/usr/bin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  sed -i 's/yes/no/' ${pkgdir}/etc/default/useradd
  mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin
  rm -rf ${pkgdir}/usr/sbin
  # remove nologin, which is provided by util-linux since 2.24
  rm -rvf ${pkgdir}/sbin
  rm ${pkgdir}/usr/share/man/man8/nologin.8
}

kiin_after_install() {
  pwconv
  grpconv
}

known="etc/group \
  etc/gshadow- \
  etc/shadow- \
  etc/gshadow \
  etc/passwd \
  etc/shadow \
  etc/.pwd.lock \
  etc/passwd- \
  etc/group-"
