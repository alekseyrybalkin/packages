#!/bin/sh

pkgname=file
pkgver=5.30
vcs=git
gittag=FILE${pkgver//\./_}
urls="ftp://ftp.astron.com/pub/file/file-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i -e 's/5.27/5.28/g' configure.ac
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
