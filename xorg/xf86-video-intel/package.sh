#!/bin/sh

pkgname=xf86-video-intel
pkgver=2.99.917+
ARCH_VERSION=2.99.917+651+g34f63f2
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
gittag=34f63f28c8f39e1d64cd159482f86cacbbff05b4
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
