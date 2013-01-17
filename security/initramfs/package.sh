#!/bin/sh

pkgname=initramfs
pkgver=1

kiin_make() {
  sudo ./mkinitramfs
}

kiin_install() {
  mkdir -p ${pkgdir}/boot
  mv -v initrd.img ${pkgdir}/boot
}
