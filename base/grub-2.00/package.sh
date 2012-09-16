#!/bin/sh

pkgname=grub
pkgver=2.00
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' grub-core/gnulib/stdio.in.h
  ./configure --prefix=/usr          \
              --sysconfdir=/etc      \
              --disable-grub-emu-usb \
              --disable-efiemu       \
              --disable-werror
  make
}

kiin_install() {
  make DESTDIR="${pkgdir}/" install
}
