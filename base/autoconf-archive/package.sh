#!/bin/sh

pkgname=autoconf-archive
pkgver=2018.03.13
vcs=git
gittag=v${pkgver}
relmon_id=142

kiin_make() {
    mkdir build-aux
    ln -sv /usr/bin/git-version-gen build-aux/git-version-gen
    touch README AUTHORS ChangeLog
    sed -i -e 's/doc//g' Makefile.am
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
