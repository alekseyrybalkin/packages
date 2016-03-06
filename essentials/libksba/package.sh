#!/bin/sh

pkgname=libksba
pkgver=1.3.3
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/libksba/"

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
