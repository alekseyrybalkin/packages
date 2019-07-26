#!/bin/sh

pkgname=libpipeline
pkgver=1.5.1
vcs=git
gittag=${pkgver}
relmon_id=1704

build() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
