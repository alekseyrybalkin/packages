#!/bin/sh

pkgname=libassuan
pkgver=2.4.2
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/libassuan/"

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
