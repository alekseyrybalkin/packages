#!/bin/sh

pkgname=yelp-xsl
pkgver=3.20.1
vcs=git
git_repo=git://git.gnome.org/yelp-xsl
gittag=${pkgver}
relmon_id=13164

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
