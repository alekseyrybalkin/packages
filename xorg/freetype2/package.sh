#!/bin/sh

pkgname=freetype2
pkgver=2.8
vcs=git
gittag=VER-${pkgver//\./-}
relmon_id=854

kiin_make() {
    patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
    patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
    sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg
    ./autogen.sh
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
