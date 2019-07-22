#!/bin/sh

pkgname=swig
pkgver=4.0.0
vcs=git
gittag=rel-${pkgver}
relmon_id=4919

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
