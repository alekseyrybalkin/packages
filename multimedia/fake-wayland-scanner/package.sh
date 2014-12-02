#!/bin/sh

pkgname=fake-wayland-scanner
pkgver=1
SKIP_ARCH_CHECK=1

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/lib/pkgconfig
  cp wayland-scanner.pc ${pkgdir}/usr/lib/pkgconfig
}
