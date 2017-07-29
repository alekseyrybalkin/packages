#!/bin/sh

pkgname=gnupg
pkgver=2.1.22
vcs=git
gittag=gnupg-${pkgver}
relmon_id=1215

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-symcryptrun \
        --libexecdir=/usr/lib \
        --sbindir=/usr/bin \
        --enable-maintainer-mode \
        --build=x86_64-unknown-linux-gnu \
        --disable-doc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
