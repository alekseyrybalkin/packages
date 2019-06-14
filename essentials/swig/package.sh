#!/bin/sh

pkgname=swig
pkgver=4.0.0
vcs=git
gittag=rel-${pkgver}
urls="http://prdownloads.sourceforge.net/swig/swig-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=4919

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
