#!/bin/sh

pkgname=mtdev
pkgver=1.1.5
vcs=git
gittag=v${pkgver}
relmon_id=8868

build() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
