#!/bin/sh

pkgname=gnumeric
pkgver=1.12.34
vcs=git
git_repo=git://git.gnome.org/gnumeric
gittag=GNUMERIC_${pkgver//\./_}
relmon_id=1213

kiin_make() {
    cp ../*.make .
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
