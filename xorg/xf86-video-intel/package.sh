#!/bin/sh

pkgname=xf86-video-intel
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel

pkgver=2.99.917+
ARCH_VERSION=2.99.917+645+g88733a7
gittag=88733a7874f7c9b45da5d612802947a9de12893a

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
