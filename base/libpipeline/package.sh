#!/bin/sh

pkgname=libpipeline
pkgver=1.5.1
vcs=git
gittag=${pkgver}
relmon_id=1704

kiin_make() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
