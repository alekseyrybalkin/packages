#!/bin/sh

pkgname=wpa_supplicant
pkgver=2.6+
vcs=git
# FIXME
gittag=c0fe5f125a9d4a6564e1f4956ccc3809bf2fd69d
#gittag=hostap_${pkgver//\./_}
relmon_id=5146

kiin_make() {
    cp ../config ${pkgname}/.config
    cd ${pkgname}
    make BINDIR=/usr/bin LIBDIR=/lib
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/man/man5
    mkdir -p ${pkgdir}/usr/share/man/man8
    cd ${pkgname}
    install -v -m755 wpa_{cli,passphrase,supplicant} ${pkgdir}/usr/bin
}
