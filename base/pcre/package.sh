#!/bin/sh

pkgname=pcre
pkgver=8.41
vcs=git-svn
vcs_pkgname=pcre-git-svn
vcs_clone="git svn clone -Ttrunk -ttags svn://vcs.exim.org/pcre/code ${vcs_pkgname}"
gittag=origin/tags/pcre-${pkgver}
extension=bz2
folder="ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/"
check_server=1
relmon_id=2610

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
        --enable-jit \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
