#!/bin/sh

pkgname=texinfo
pkgver=6.1
# git-svn only from r5000 (git-svn crashes for -r 4000:HEAD or earlier)
vcs=git-svn
vcs_pkgname=texinfo-git-svn
svnrev=6991
urls="http://ftp.gnu.org/gnu/texinfo/texinfo-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/info/dir"
