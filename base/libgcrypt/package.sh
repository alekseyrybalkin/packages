#!/bin/sh

pkgname=libgcrypt
pkgver=1.8.4
vcs=git
gittag=libgcrypt-${pkgver}
relmon_id=1623

kiin_make() {
    ./autogen.sh
    ./configure --disable-doc \
        --enable-maintainer-mode \
        --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
