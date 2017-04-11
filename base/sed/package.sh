#!/bin/sh

pkgname=sed
pkgver=4.4
vcs=git
gittag=v${pkgver}
urls="http://ftp.gnu.org/gnu/sed/sed-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    sed -i -e '/\/missing/d' bootstrap
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
