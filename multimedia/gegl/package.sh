#!/bin/sh

pkgname=gegl
vcs=git

pkgver=0.3.14
gittag=GEGL_${pkgver//\./_}

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr --without-librsvg
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
