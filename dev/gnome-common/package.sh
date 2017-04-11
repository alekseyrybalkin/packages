#!/bin/sh

pkgname=gnome-common
pkgver=3.18.0
vcs=git
git_repo=git://git.gnome.org/gnome-common
gittag=1df0aa160b1ce6d1e1f01085253b665fe6d0d1ef
relmon_id=8421

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
