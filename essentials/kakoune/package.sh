#!/bin/sh

pkgname=kakoune
pkgver=20161213
vcs=git
gittag=e44129577a010ebb4dc609b806104d3175659074
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    cd src
    debug=no make
}

kiin_install() {
    cd src
    debug=no make install-strip DESTDIR=${pkgdir} PREFIX=/usr
}
