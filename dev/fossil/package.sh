#!/bin/sh

pkgname=fossil
pkgver=2.5
vcs=fossil
vcs_clone='fossil clone https://www.fossil-scm.org fossil.fossil'
fossiltag=version-${pkgver}
urls="https://www.fossil-scm.org/download/fossil-src-${pkgver}.tar.gz"
srctar=fossil-src-${pkgver}.tar.gz
relmon_id=13971

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
