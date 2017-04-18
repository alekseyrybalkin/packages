#!/bin/sh

pkgname=gegl
vcs=git

pkgver=0.3.14
gittag=GEGL_${pkgver//\./_}


kiin_make() {
    git cherry-pick 81fb956b221e4b1f919788d8a5f6a3a5462b86ae
    ./autogen.sh --prefix=/usr --without-librsvg
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
