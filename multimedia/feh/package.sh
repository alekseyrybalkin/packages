#!/bin/sh

pkgname=feh
pkgver=2.25.1
vcs=git
gittag=${pkgver}
urls="http://feh.finalrewind.org/feh-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=790

undead_make() {
    make PREFIX=/usr
}

undead_install() {
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
