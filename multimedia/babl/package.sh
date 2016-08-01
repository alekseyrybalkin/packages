#!/bin/sh

pkgname=babl
pkgver=0.1.18
vcs=git
gittag=BABL_${pkgver//\./_}
urls="http://download.gimp.org/pub/babl/0.1/babl-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-docs
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
