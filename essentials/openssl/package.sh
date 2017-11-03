#!/bin/sh

pkgname=openssl
# pkgver too complex to parse, we check git tags instead
SKIP_ARCH_CHECK=1
pkgver=1.1.0g
vcs=git
gittag=OpenSSL_${pkgver//\./_}
relmon_id=2566

kiin_make() {
    ./config --prefix=/usr \
        --libdir=lib \
        --openssldir=/etc/ssl \
        shared
    make
}

kiin_install() {
    sed -i 's# libcrypto.a##;s# libssl.a##' Makefile
    make DESTDIR=${pkgdir} MANDIR=/usr/share/man MANSUFFIX=ssl install
}
