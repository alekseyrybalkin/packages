#!/bin/sh

pkgname=pinentry
pkgver=0.9.7
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/pinentry/"

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
