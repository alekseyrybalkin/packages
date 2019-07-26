#!/bin/sh

pkgname=libassuan
pkgver=2.5.3
vcs=git
gittag=libassuan-${pkgver}
relmon_id=1559

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --enable-maintainer-mode
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
