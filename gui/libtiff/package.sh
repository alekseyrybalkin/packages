#!/bin/sh

#vcs=cvs
pkgname=libtiff
pkgver=4.0.7
urls="http://download.osgeo.org/${pkgname}/tiff-${pkgver}.tar.gz"
srctar=tiff-${pkgver}.tar.gz
srcdir=${location}/tiff-${pkgver}

kiin_make() {
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
