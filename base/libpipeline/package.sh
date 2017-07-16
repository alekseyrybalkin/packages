#!/bin/sh

pkgname=libpipeline
pkgver=1.4.2
vcs=git
gittag=${pkgver}
urls="http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=1704

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
