#!/bin/sh

pkgname=xf86-video-intel
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel

pkgver=2.99.917+
# git describe --long | sed 's/-/+/g'
ARCH_VERSION=2.99.917+676+g26f8ab5
gittag=26f8ab5429a554801641415f0ab3b2d68cea1d00

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
