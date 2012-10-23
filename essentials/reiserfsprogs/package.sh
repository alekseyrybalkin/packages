#!/bin/sh

pkgname=reiserfsprogs
pkgver=3.6.21
urls="ftp://anduin.linuxfromscratch.org/BLFS/svn/r/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sbindir=/sbin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sf reiserfsck ${pkgdir}/sbin/fsck.reiserfs
  ln -sf mkreiserfs ${pkgdir}/sbin/mkfs.reiserfs
}
