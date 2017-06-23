#!/bin/sh

pkgname=psmisc
pkgver=23.1
vcs=git
# FIXME
gittag=bd952b3063f2466ecab4ec093026cf0c4ce373c7
#gittag=v${pkgver}
urls="http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=3721

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
