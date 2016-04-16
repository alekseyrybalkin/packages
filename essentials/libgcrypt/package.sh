#!/bin/sh

pkgname=libgcrypt
pkgver=1.7.0
vcs=git
gittag=libgcrypt-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    if [ -n "${KIIN_LIB32}" ]; then
        sed 's:path="amd64":path="i586 i386":' -i mpi/config.links
    fi
    ./autogen.sh
    ./configure --disable-doc --enable-maintainer-mode --prefix=/usr --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
