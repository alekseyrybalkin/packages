#!/bin/sh

pkgname=argtable
pkgver=2.13
urls="http://prdownloads.sourceforge.net/argtable/${pkgname}${pkgver//\./-}.tar.gz"
srctar=${pkgname}${pkgver//\./-}.tar.gz
srcdir=${location}/${pkgname}${pkgver//\./-}

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    sed -i '/^install-data-am:/s/install-dist_exampleDATA //' Makefile
    make SUBDIRS="src tests" DESTDIR=${pkgdir} install
}
