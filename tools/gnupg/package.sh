#!/bin/sh

pkgname=gnupg
pkgver=2.2.17
vcs=git
gittag=gnupg-${pkgver}
relmon_id=1215

build() {
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

package() {
    make DESTDIR=${pkgdir} install
}
