#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
git_pkgname=linux-stable
vcs="git"
pkgver=4.5
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make mrproper
  cp -v ../config-x86_64-`hostname` .config
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/boot
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin
}
