#!/bin/sh

pkgname=linux-libre
pkgver=3.10.7
urls="http://linux-libre.fsfla.org/pub/linux-libre/releases/${pkgver}-gnu/linux-libre-${pkgver}-gnu.tar.xz"
srctar=${pkgname}-${pkgver}-gnu.tar.xz
srcdir=${location}/linux-${pkgver}

kiin_make() {
  make mrproper
  cp -v ../config-x86_64-`hostname` .config
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/boot
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-libre-kiin
}
