#!/bin/sh

pkgname=linux
vcs="git"
gittag=v3.7-rc1
pkgver=`echo ${gittag} | sed 's/^v//g' | sed 's/-/\./g'`
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make mrproper
  cp -v ../config-x86_64 .config
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/boot
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin

  # remove installed firmware, package `linux-firmware` deals with that
  rm -rf ${pkgdir}/lib/firmware
}
