#!/bin/sh

pkgname=fossil
pkgver=2.8
vcs=fossil
vcs_clone='fossil clone https://www.fossil-scm.org fossil.fossil'
fossiltag=version-${pkgver}
urls="https://fossil-scm.org/index.html/uv/fossil-src-${pkgver}.tar.gz"
srctar=fossil-src-${pkgver}.tar.gz
# lists 2.9 before release
#relmon_id=13971

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
