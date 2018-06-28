#!/bin/sh

pkgname=yelp-xsl
pkgver=3.28.0
vcs=git
git_repo=git://git.gnome.org/yelp-xsl
gittag=${pkgver}
# rc versions
#relmon_id=13164

undead_make() {
    ./autogen.sh --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
