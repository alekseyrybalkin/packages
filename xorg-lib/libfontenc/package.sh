#!/bin/sh

pkgname=libfontenc
pkgver=1.1.3
vcs=git
gittag=libfontenc-${pkgver}
relmon_id=1613

kiin_make() {
    ./autogen.sh ${XORG_CONFIG}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
