#!/bin/sh

pkgname=bison
pkgver=3.4.1
vcs=git
gittag=v${pkgver}
relmon_id=193

build() {
    git clone -s `find_vcs_repo gnulib`
    cd submodules
    git clone -s `find_vcs_repo autoconf`
    cd ../
    git submodule update --init
    sed -i -e 's/gnulib-po//g' Makefile.am
    sed -i -e '/gnulib-po/d' configure.ac
    ./bootstrap --skip-po
    ./configure --prefix=/usr --docdir=/usr/share/doc/bison
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
