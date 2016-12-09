#!/bin/sh

pkgname=openvpn
pkgver=2.3.14
vcs=git
gittag=v${pkgver}
urls="http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

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
