#!/bin/sh

pkgname=yelp-xsl
pkgver=3.32.1
vcs=git
gittag=${pkgver}
# rc versions
#relmon_id=13164

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
