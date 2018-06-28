#!/bin/sh

pkgname=libevent
pkgver=2.1.8
vcs=git
gittag=release-${pkgver}-stable
urls="http://downloads.sourceforge.net/levent/libevent-${pkgver}-stable.tar.gz"
srctar=${pkgname}-${pkgver}-stable.tar.gz
relmon_id=1606

undead_make() {
    sed -i 's#python#python2#' event_rpcgen.py
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
