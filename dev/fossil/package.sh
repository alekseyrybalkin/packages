#!/bin/sh

pkgname=fossil
pkgver=1.37
vcs=fossil
fossiltag=version-${pkgver}
urls="https://www.fossil-scm.org/download/fossil-src-${pkgver}.tar.gz"
srctar=fossil-src-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-src-${pkgver}

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
