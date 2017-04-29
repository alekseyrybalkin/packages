#!/bin/sh

pkgname=dosfstools
pkgver=4.1
vcs=git
gittag=v${pkgver}
relmon_id=455

kiin_make() {
    autoreconf -fi
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib \
        --sbindir=/usr/bin \
        --mandir=/usr/share/man \
        --docdir=/usr/share/doc/dosfstools \
        --enable-compat-symlinks
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
