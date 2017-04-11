#!/bin/sh

pkgname=openvpn
pkgver=2.4.1
vcs=git
gittag=v${pkgver}
urls="http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

kiin_make() {
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --enable-password-save \
        --mandir=/usr/share/man \
        --disable-plugin-auth-pam \
        --enable-iproute2
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
