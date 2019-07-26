#!/bin/sh

pkgname=libevent
pkgver=2.1.10
vcs=git
gittag=release-${pkgver}-stable
relmon_id=1606

build() {
    sed -i 's#python#python2#' event_rpcgen.py
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
