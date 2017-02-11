#!/bin/sh

pkgname=gperf
pkgver=3.1
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --docdir=/usr/share/doc/gperf
    echo -e "all:\n\ninstall:" > doc/Makefile
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
