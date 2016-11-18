#!/bin/sh

pkgname=python-gobject
pkgver=3.22.0
vcs=git
vcs_pkgname=pygobject
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr --with-python=/usr/bin/python
    sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
}

kiin_install() {
    make DESTDIR="$pkgdir" install
}
