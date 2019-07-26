#!/bin/sh

pkgname=wpa_supplicant
pkgver=2.8
vcs=git
gittag=hostap_${pkgver//\./_}
relmon_id=5146

build() {
    cp ../config ${pkgname}/.config
    cd ${pkgname}
    make BINDIR=/usr/bin LIBDIR=/lib
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/man/man5
    mkdir -p ${pkgdir}/usr/share/man/man8
    cd ${pkgname}
    install -v -m755 wpa_{cli,passphrase,supplicant} ${pkgdir}/usr/bin
}
