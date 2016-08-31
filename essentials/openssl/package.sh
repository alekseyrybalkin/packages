#!/bin/sh

pkgname=openssl
# pkgver too complex to parse, we check git tags instead
SKIP_ARCH_CHECK=1
pkgver=1.0.2h
vcs=git
gittag=OpenSSL_${pkgver//\./_}
extension=gz
folder="http://www.openssl.org/source/"
check_server=1

. ${KIIN_REPO}/defaults.sh

urls="${urls}"

kiin_make() {
    MAKEFLAGS=
    sed -i -e '2,55d' util/pod2mantest
    if [ -z "$KIIN_LIB32" ]; then
        ./config --prefix=/usr \
            --libdir=lib \
            --openssldir=/etc/ssl \
            shared
    else
        ./Configure --prefix=/usr \
            --openssldir=/etc/ssl \
            shared \
            linux-elf \
            --libdir=lib32
    fi
    make
}

kiin_install() {
    MAKEFLAGS=
    sed -i 's# libcrypto.a##;s# libssl.a##' Makefile
    make INSTALL_PREFIX=${pkgdir} MANDIR=/usr/share/man MANSUFFIX=ssl install
    install -v -d -m755 ${pkgdir}/usr/share/doc/openssl
    cp -v -r doc/* \
        ${pkgdir}/usr/share/doc/openssl
}
