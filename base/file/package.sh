#!/bin/sh

pkgname=file
pkgver=5.35
vcs=git
gittag=FILE${pkgver//\./_}
relmon_id=807

kiin_make() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
