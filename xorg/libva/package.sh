#!/bin/sh

pkgname=libva
pkgver=2.4.1
vcs=git
gittag=${pkgver}
# rc
#relmon_id=1752

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
