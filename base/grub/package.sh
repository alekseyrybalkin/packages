#!/bin/sh

pkgname=grub
# magic in PKGBUILD
SKIP_ARCH_CHECK=1
pkgver=2.02
vcs=git
gittag=${pkgver}
relmon_id=1258
relmon_sed='s/~/\./g'

build() {
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

package() {
    make DESTDIR="${pkgdir}/" install
    mkdir -pv ${pkgdir}/boot/grub/i386-pc
    cp -av ${pkgdir}/usr/lib/grub/i386-pc/*.{mod,lst} ${pkgdir}/boot/grub/i386-pc
    cp -av ${pkgdir}/usr/lib/grub/i386-pc/boot.img ${pkgdir}/boot/grub/i386-pc
}

known="boot/grub/i386-pc/core.img \
    boot/grub/i386-pc/load.cfg \
    boot/grub/i386-pc/modinfo.sh \
    boot/grub/grubenv \
    boot/grub/grub.cfg"
