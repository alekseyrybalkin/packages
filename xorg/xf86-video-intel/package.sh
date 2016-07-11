#!/bin/sh

pkgname=xf86-video-intel
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel

pkgver=2.99.917+
# git describe --long | sed 's/-/+/g'
ARCH_VERSION=2.99.917+666+g7b6e219
gittag=7b6e219fe461fbbe0bd498f7731781358d11f934

srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
