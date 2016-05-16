#!/bin/sh

pkgname=xf86-video-intel
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel

pkgver=2.99.917+
ARCH_VERSION=2.99.917+631+gf2a4645
gittag=f2a46458a257777438361f74d7e6abee92c7f294

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
