#!/bin/sh

pkgname=npth
pkgver=1.6
vcs=git
gittag=npth-${pkgver}
relmon_id=2505

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
