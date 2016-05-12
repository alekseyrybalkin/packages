#!/bin/sh

pkgname=xf86-video-intel
pkgver=2.99.917+
ARCH_VERSION=2.99.917+641+ge4ef6e9
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
gittag=e4ef6e9e5b2c8b637356621c60b28d064d40d29c
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
