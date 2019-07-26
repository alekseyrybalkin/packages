#!/bin/sh

pkgname=libtiff
pkgver=4.0.10
vcs=git
gittag=v${pkgver}
relmon_id=1738

build() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
