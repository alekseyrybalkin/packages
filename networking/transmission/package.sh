#!/bin/sh

pkgname=transmission
pkgver=2.92
vcs=git-svn
vcs_pkgname=transmission-git-svn
svnrev=14713
extension=xz
folder="https://download.transmissionbt.com/files/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    sed -i -e '/gtr_get_favicon/d' gtk/details.c
    sed -i -e '/gtr_get_favicon/d' gtk/filter.c
    rm m4/glib-gettext.m4
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
