#!/bin/sh

pkgname=xf86-video-intel
pkgver=2.99.917+
ARCH_VERSION=2.99.917+560+gd167280
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
gittag=3cc011ae11be6437241c3411bce1935ec0b187f5
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
