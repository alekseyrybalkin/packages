#!/bin/sh

pkgname=libgpg-error
pkgver=1.36
vcs=git
gittag=libgpg-error-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/${pkgname}/"
check_server=1
relmon_id=1628

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    sed -i 's/namespace/pkg_&/' src/Makefile.{am,in} src/mkstrtable.awk
    ./configure --enable-maintainer-mode \
        --prefix=/usr \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
