#!/bin/sh

pkgname=psmisc
pkgver=23.2
vcs=git
gittag=v${pkgver}
relmon_id=3721

build() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
