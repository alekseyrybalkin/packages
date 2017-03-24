#!/bin/sh

pkgname=atk
pkgver=2.24.0
vcs=git
gittag=ATK_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
