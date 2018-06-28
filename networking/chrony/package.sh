#!/bin/sh

pkgname=chrony
pkgver=3.3
vcs=git
gittag=${pkgver}
relmon_id=8810

undead_make() {
    sed -i -e '/doc install$/d' Makefile.in
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/usr/sbin/chronyd ${pkgdir}/usr/bin
    rmdir ${pkgdir}/usr/sbin
    rm -rf ${pkgdir}/var
}
