#!/bin/sh

pkgname=libevdev
pkgver=1.4.2
vcs=git
git_repo=git://anongit.freedesktop.org/libevdev
gittag=libevdev-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
