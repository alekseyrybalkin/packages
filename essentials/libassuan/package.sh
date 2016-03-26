#!/bin/sh

pkgname=libassuan
pkgver=2.4.2
vcs=git
gittag=libassuan-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/libassuan/"

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --enable-maintainer-mode
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
