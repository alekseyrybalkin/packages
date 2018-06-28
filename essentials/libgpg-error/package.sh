#!/bin/sh

pkgname=libgpg-error
pkgver=1.28
vcs=git
gittag=libgpg-error-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/${pkgname}/"
check_server=1
relmon_id=1628

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./autogen.sh
    ./configure --enable-maintainer-mode \
        --prefix=/usr \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --libdir=${LIBDIR}
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
