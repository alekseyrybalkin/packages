#!/bin/sh

pkgname=linux-libre
pkgver=3.11
extension=xz
folder="http://linux-libre.fsfla.org/pub/linux-libre/releases/"
check_server=1

srctar=${pkgname}-${pkgver}-gnu.tar.${extension}
srcdir=${location}/linux-${pkgver}

. ${KIIN_HOME}/defaults.sh

urls="${folder}${pkgver}-gnu/${srctar}"
ver_grep="^[^-]*-gnu/$"
ver_seds() {
  sed -r "s/-gnu\/$//g"
}

kiin_make() {
  make mrproper
  cp -v ../config-x86_64-`hostname` .config
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/boot
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-libre-kiin
}
