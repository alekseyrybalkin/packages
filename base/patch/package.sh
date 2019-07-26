#!/bin/sh

pkgname=patch
pkgver=2.7.6
vcs=git
gittag=v${pkgver}
relmon_id=2597

build() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
