#!/bin/sh

pkgname=texinfo
pkgver=6.3
vcs=git-svn
vcs_pkgname=texinfo-git-svn
vcs_clone="git svn clone -Ttrunk -ttags svn://svn.savannah.gnu.org/texinfo/ ${vcs_pkgname}"
gittag=origin/tags/texinfo_${pkgver//\./_}
urls="http://ftp.gnu.org/gnu/texinfo/texinfo-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/info/dir"
