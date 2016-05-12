#!/bin/sh

pkgname=fluxbox
pkgver=1.3.7
vcs=git
gittag=Release-${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-imlib2
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
