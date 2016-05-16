#!/bin/sh

pkgname=tar
pkgver=1.29
vcs=git
gittag=release_${pkgver//\./_}
urls="http://ftp.gnu.org/gnu/tar/tar-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    git clone ${KIIN_HOME}/sources/gnulib
    git clone ${KIIN_HOME}/sources/paxutils
    ./bootstrap --skip-po
    ./configure --prefix=/usr --enable-gcc-warnings=no --libexecdir=/usr/bin
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar
}
