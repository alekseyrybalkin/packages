#!/bin/sh

pkgname=gobject-introspection
pkgver=1.60.2
vcs=git
gittag=${pkgver}
# development versions
#relmon_id=1223

build() {
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
