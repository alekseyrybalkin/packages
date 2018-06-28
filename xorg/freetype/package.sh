#!/bin/sh

pkgname=freetype
ARCH_NAME=freetype2
pkgver=2.9
vcs=git
vcs_pkgname=freetype2
gittag=VER-${pkgver//\./-}
relmon_id=854

undead_make() {
    patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
    patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
    sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg
    ./autogen.sh
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
