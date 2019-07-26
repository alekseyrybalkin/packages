#!/bin/sh

pkgname=xmlto
pkgver=0.0.28
vcs=git
#FIXME no tag
gittag=b128bdcf7b15865aaae49635a1dcbcaca07fc6ef
relmon_id=13307

build() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
