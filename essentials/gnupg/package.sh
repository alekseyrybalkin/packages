#!/bin/sh

pkgname=gnupg
pkgver=2.1.18
vcs=git
gittag=gnupg-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-symcryptrun \
        --libexecdir=/usr/lib \
        --sbindir=/usr/bin \
        --enable-maintainer-mode \
        --disable-doc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
