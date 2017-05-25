#!/bin/sh

#vcs=cvs
pkgname=libtiff
pkgver=4.0.8
urls="http://download.osgeo.org/${pkgname}/tiff-${pkgver}.tar.gz"
srctar=tiff-${pkgver}.tar.gz
srcdir=${location}/tiff-${pkgver}
relmon_id=1738

kiin_make() {
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
