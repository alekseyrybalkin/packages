#!/bin/sh

pkgname=reiserfsprogs
vcs="git"
gittag=v3.6.22
pkgver=3.6.22
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
