#!/bin/sh

pkgname=xf86-video-intel
pkgver=2.99.917+
ARCH_VERSION=2.99.917+587+gc186d4d
vcs=git
git_repo=git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
gittag=094924f7f882da1f32395d4c982db6ad8e0f609f
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --enable-dri --libexecdir=/usr/lib $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
