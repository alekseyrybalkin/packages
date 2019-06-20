#!/bin/sh

pkgname=gobject-introspection
pkgver=1.60.1
vcs=git
gittag=${pkgver}
# development versions
#relmon_id=1223

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
