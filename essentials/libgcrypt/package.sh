#!/bin/sh

pkgname=libgcrypt
pkgver=1.6.5
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
    # disable docs, building them requires fig2dev from xfig
    sed -i -e '/doc\/Makefile/d' configure.ac
    sed -i -e 's/doc\/ChangeLog-2011//g' Makefile.am
    sed -i -e 's/doc//g' Makefile.am
    rm -rf doc
    ./autogen.sh
    ./configure --enable-maintainer-mode --prefix=/usr --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
