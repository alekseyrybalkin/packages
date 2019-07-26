#!/bin/sh

pkgname=libfontenc
pkgver=1.1.4
vcs=git
gittag=libfontenc-${pkgver}
relmon_id=1613

build() {
    ./autogen.sh ${XORG_CONFIG}
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
