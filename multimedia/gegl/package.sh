#!/bin/sh

pkgname=gegl
vcs=git

pkgver=0.3.8
gittag=GEGL_${pkgver//\./_}

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
