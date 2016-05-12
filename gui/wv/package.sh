#!/bin/sh

pkgname=wv
pkgver=1.2.9
vcs=git
gittag=wv-${pkgver//\./-}
urls="http://www.abisource.com/downloads/wv/${pkgver}/wv-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
