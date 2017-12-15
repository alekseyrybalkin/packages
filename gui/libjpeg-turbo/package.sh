#!/bin/sh

pkgname=libjpeg-turbo
pkgver=1.5.3
vcs=git
gittag=${pkgver}
urls="http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=1648

kiin_make() {
    autoreconf -fi
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --with-jpeg8 \
        --disable-static \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} \
        docdir=/usr/share/doc/${pkgname} \
        exampledir=/usr/share/doc/${pkgname} \
        install
}
