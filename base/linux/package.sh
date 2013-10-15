#!/bin/sh

pkgname=linux
git_pkgname=linux-stable
vcs="git"
gittag=v3.11.5
pkgver=3.11.5
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make mrproper
  cp -v ../config-x86_64-`hostname` .config
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/boot
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin

  # remove installed firmware, package `linux-firmware` deals with that
  rm -rf ${pkgdir}/lib/firmware
}
