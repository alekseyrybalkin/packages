#!/bin/sh

pkgname=patch
pkgver=2.7.6
vcs=git
gittag=v${pkgver}
relmon_id=2597

kiin_make() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
