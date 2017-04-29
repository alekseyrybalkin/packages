#!/bin/sh

pkgname=libksba
pkgver=1.3.5
vcs=git
gittag=libksba-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/libksba/"
relmon_id=1649

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --enable-maintainer-mode
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
