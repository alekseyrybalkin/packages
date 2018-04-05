#!/bin/sh

pkgname=gmp
_majorver=6.1
pkgver=${_majorver}.2
vcs=mercurial
vcs_pkgname=gmp-${_majorver}
# FIXME
hgtag=aad821ef06cb
relmon_id=1186

kiin_make() {
    ./.bootstrap
    ./configure --prefix=/usr \
        --enable-cxx \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --docdir=/usr/share/doc/gmp
    make
    make html
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-html
}
