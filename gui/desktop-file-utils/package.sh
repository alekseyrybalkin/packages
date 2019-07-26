#!/bin/sh

pkgname=desktop-file-utils
pkgver=0.23
ARCH_VERSION=0.23+4+g92af410
vcs=git
gittag=${pkgver}
relmon_id=421

build() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
