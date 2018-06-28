#!/bin/sh

pkgname=libevdev
pkgver=1.5.9
vcs=git
git_repo=git://anongit.freedesktop.org/libevdev
gittag=libevdev-${pkgver}

undead_make() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
