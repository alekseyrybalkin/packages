#!/bin/sh

pkgname=transmission
pkgver=2.93
vcs=git
vcs_clone="git clone https://github.com/transmission/transmission.git"
gittag=${pkgver}
extension=xz
folder="https://download.transmissionbt.com/files/"
check_server=1
relmon_id=5002

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    sed -i -e '/gtr_get_favicon/d' gtk/details.c
    sed -i -e '/gtr_get_favicon/d' gtk/filter.c
    rm m4/glib-gettext.m4
    ./autogen.sh --prefix=/usr --enable-cli
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
