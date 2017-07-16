#!/bin/sh

pkgname=goffice
pkgver=0.10.35
vcs=git
git_repo=git://git.gnome.org/goffice
gittag=GOFFICE_${pkgver//\./_}
relmon_id=1226

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
