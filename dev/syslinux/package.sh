#!/bin/sh

pkgname=syslinux
pkgver=6.03
vcs=git
gittag=syslinux-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    MAKEFLAGS=
    patch -p1 < ../gcc-fix-alignment.patch
    patch -p1 < ../dont-guess-alignment.patch
    patch -p1 < ../kdb-230.patch
    make PYTHON=python2 bios efi32
}

kiin_install() {
    MAKEFLAGS=
    make bios efi32 install INSTALLROOT=${pkgdir} SBINDIR=/usr/bin MANDIR=/usr/share/man AUXDIR=/usr/lib/syslinux

    rm -r ${pkgdir}/usr/lib/syslinux/{com32,dosutil,syslinux.com}
    install -d ${pkgdir}/usr/lib/syslinux/bios
    mv ${pkgdir}/usr/lib/syslinux/{*.bin,*.c32,*.0,memdisk} ${pkgdir}/usr/lib/syslinux/bios

    install -D -m0644 ../syslinux.cfg ${pkgdir}/boot/syslinux/syslinux.cfg
    install -D -m0755 ../syslinux-install_update ${pkgdir}/usr/bin/syslinux-install_update
}
