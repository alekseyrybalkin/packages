#!/bin/sh

pkgname=babl
pkgver=0.1.24
vcs=git
gittag=BABL_${pkgver//\./_}
urls="http://download.gimp.org/pub/babl/0.1/babl-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=7843

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-docs
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
