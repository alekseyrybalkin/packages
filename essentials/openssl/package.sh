#!/bin/sh

pkgname=openssl
# pkgver too complex to parse, we check git tags instead
SKIP_ARCH_CHECK=1
pkgver=1.1.0h
vcs=git
gittag=OpenSSL_${pkgver//\./_}
relmon_id=2566

undead_make() {
    ./config --prefix=/usr \
        --libdir=lib \
        --openssldir=/etc/ssl \
        shared
    make
}

undead_install() {
    sed -i 's# libcrypto.a##;s# libssl.a##' Makefile
    make DESTDIR=${pkgdir} MANDIR=/usr/share/man MANSUFFIX=ssl install
}
