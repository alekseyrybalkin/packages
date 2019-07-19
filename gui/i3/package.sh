#!/bin/sh

pkgname=i3
ARCH_NAME=i3-wm
pkgver=4.16.1
vcs=git
gittag=${pkgver}
relmon_id=1348

kiin_make() {
    # https://github.com/i3/i3/pull/2925
    #sed -i -e 's/CAIRO_OPERATOR_SOURCE/CAIRO_OPERATOR_OVER/g' libi3/font.c

    # https://github.com/i3/i3/issues/3652
    git cherry-pick 4e5ce56188629634ad35a5aaf24a1f6d506ac19d

    autoreconf -fvi
    mkdir build
    cd build
    ../configure --prefix=/usr --sysconfdir=/etc
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
