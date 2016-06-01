#!/bin/sh

pkgname=xf86-video-intel
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel

pkgver=2.99.917+
# git describe --long | sed 's/-/+/g'
ARCH_VERSION=2.99.917+662+gb617f80
gittag=b617f80ca5d386c1c248bab64276a9f283173a21

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
