#!/bin/sh

pkgname=initramfs
pkgver=1

kiin_make() {
  true
}

kiin_install() {
  ./mkinitramfs
  mkdir -p ${pkgdir}/boot
  mv -v initrd.img ${pkgdir}/boot
}
