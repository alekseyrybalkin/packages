#!/bin/sh

pkgname=npth
pkgver=1.2
vcs=git
gittag=npth-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/npth/"

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
