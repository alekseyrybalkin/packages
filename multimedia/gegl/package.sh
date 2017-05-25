#!/bin/sh

pkgname=gegl
vcs=git

pkgver=0.3.16
gittag=GEGL_${pkgver//\./_}


kiin_make() {
    ./autogen.sh --prefix=/usr --without-librsvg
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
