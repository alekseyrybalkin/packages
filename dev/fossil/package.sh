#!/bin/sh

pkgname=fossil
pkgver=2.1
vcs=fossil
fossiltag=version-${pkgver}
urls="https://www.fossil-scm.org/download/fossil-src-${pkgver}.tar.gz"
srctar=fossil-src-${pkgver}.tar.gz

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
