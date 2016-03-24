#!/bin/sh

pkgname=xf86-video-intel
pkgver=2.99.917+
ARCH_VERSION=2.99.917+586+g4e108af
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
gittag=4e108afe55f6b13aa946d1252ff0b828929245b3
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
