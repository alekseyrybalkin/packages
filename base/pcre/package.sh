#!/bin/sh

pkgname=pcre
pkgver=8.38
vcs=git-svn
git_pkgname=pcre-git-svn
svnrev=1609
extension=bz2
folder="ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --docdir=/usr/share/doc/pcre \
        --enable-unicode-properties \
        --enable-pcre16 \
        --enable-pcre32 \
        --enable-pcregrep-libz \
        --enable-pcregrep-libbz2 \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
