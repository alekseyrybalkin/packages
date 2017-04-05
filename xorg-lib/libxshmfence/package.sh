#!/bin/sh

pkgname=libxshmfence
pkgver=1.2
vcs=git
gittag=${pkgname}-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=1792

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
