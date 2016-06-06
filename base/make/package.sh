#!/bin/sh

pkgname=make
pkgver=4.2
vcs=git
gittag=${pkgver}
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    # fix parallel builds for some packages, e.g. perl, git, ncurses
    git cherry-pick 4762480ae9cb8df4878286411f178d32db14eff0
    sed -i -e 's/po //g' Makefile.am
    sed -i -e 's/doc //g' Makefile.am
    sed -i -e 's/-Werror//g' configure.ac
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
