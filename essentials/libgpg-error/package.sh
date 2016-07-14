#!/bin/sh

pkgname=libgpg-error
pkgver=1.24
vcs=git
gittag=libgpg-error-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --enable-maintainer-mode --prefix=/usr --disable-static --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
