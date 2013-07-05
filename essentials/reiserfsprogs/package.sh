#!/bin/sh

pkgname=reiserfsprogs
vcs="git"
gittag=b4582fed408ace5bbbca6d39069d69a4691de9aa
pkgver=3.6.23
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -i -f
  ./configure --prefix=/usr --sbindir=/sbin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sf reiserfsck ${pkgdir}/sbin/fsck.reiserfs
  ln -sf mkreiserfs ${pkgdir}/sbin/mkfs.reiserfs
}
