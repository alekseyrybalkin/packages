#!/bin/sh

pkgname=grub
pkgver=2.02+
vcs=git
gittag=70b002de55abbfd6b2d2f2ea4408078d93c9e0de
ARCH_VERSION=2.02.beta2
urls="http://rybalkin.org/kiin-files/unicode.pf2"
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --disable-grub-emu-usb \
    --disable-efiemu \
    --disable-device-mapper \
    --disable-grub-mkfont \
    --disable-werror
  make
}

kiin_install() {
  make DESTDIR="${pkgdir}/" install
  mkdir -pv ${pkgdir}/boot/grub/i386-pc
  cp -av ${pkgdir}/usr/lib/grub/i386-pc/*.{mod,lst,img} ${pkgdir}/boot/grub/i386-pc
  mkdir ${pkgdir}/boot/grub/fonts
  cp -av ${KIIN_HOME}/tarballs/unicode.pf2 ${pkgdir}/boot/grub/fonts
}

known="boot/grub/i386-pc/core.img \
  boot/grub/i386-pc/modinfo.sh \
  boot/grub/grubenv"
