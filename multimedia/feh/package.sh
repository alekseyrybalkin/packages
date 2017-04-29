#!/bin/sh

pkgname=feh
pkgver=2.18.3
vcs=git
gittag=${pkgver}
urls="http://feh.finalrewind.org/feh-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=790

kiin_make() {
    make PREFIX=/usr
}

kiin_install() {
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
