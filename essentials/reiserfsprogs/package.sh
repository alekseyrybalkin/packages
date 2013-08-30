#!/bin/sh

pkgname=reiserfsprogs
vcs="git"
gittag=fe11487be99b5df3607c039f3ba279536eecc569
pkgver=3.6.24
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
