#!/bin/sh

pkgname=grub
pkgver=2.02.beta3
vcs=git
gittag=2.02-beta3
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --disable-grub-emu-usb \
        --disable-efiemu \
        --enable-device-mapper \
        --disable-grub-mkfont \
        --disable-werror
    make
}

kiin_install() {
    make DESTDIR="${pkgdir}/" install
    mkdir -pv ${pkgdir}/boot/grub/i386-pc
    cp -av ${pkgdir}/usr/lib/grub/i386-pc/*.{mod,lst} ${pkgdir}/boot/grub/i386-pc
    cp -av ${pkgdir}/usr/lib/grub/i386-pc/boot.img ${pkgdir}/boot/grub/i386-pc
}

known="boot/grub/i386-pc/core.img \
    boot/grub/i386-pc/load.cfg \
    boot/grub/i386-pc/modinfo.sh \
    boot/grub/grubenv"
