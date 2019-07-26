#!/bin/sh

pkgname=libksba
pkgver=1.3.5
vcs=git
gittag=libksba-${pkgver}
relmon_id=1649

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
