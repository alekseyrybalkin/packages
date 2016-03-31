#!/bin/sh

#vcs=none
pkgname=initramfs
SKIP_ARCH_CHECK=1
pkgver=1

kiin_make() {
  true
}

kiin_install() {
  ./mkinitramfs
  mkdir -p ${pkgdir}/boot
  mv -v initrd.img ${pkgdir}/boot
}
