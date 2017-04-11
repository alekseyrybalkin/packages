#!/bin/sh

pkgname=gnupg
pkgver=2.1.19
vcs=git
gittag=gnupg-${pkgver}

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
