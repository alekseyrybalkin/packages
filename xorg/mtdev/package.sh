#!/bin/sh

pkgname=mtdev
pkgver=1.1.5
vcs=git
git_repo=http://bitmath.org/git/mtdev.git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
