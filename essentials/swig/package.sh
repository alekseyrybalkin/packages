#!/bin/sh

pkgname=swig
pkgver=3.0.12
vcs=git
gittag=rel-${pkgver}
urls="http://prdownloads.sourceforge.net/swig/swig-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=4919

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
