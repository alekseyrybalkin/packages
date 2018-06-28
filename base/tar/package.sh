#!/bin/sh

pkgname=tar
pkgver=1.30
vcs=git
gittag=release_${pkgver//\./_}
urls="http://ftp.gnu.org/gnu/tar/tar-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=4939

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    git clone -s ${UNDEAD_HOME}/sources/paxutils
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --enable-gcc-warnings=no \
        --build=x86_64-unknown-linux-gnu \
        --libexecdir=/usr/bin
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar
}
