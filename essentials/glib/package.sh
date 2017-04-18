#!/bin/sh

pkgname=glib
ARCH_NAME=glib2
majorver=2.52
pkgver=${majorver}.1
ARCH_VERSION=2.52.1+2+g2b47c8360
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --with-pcre=system \
        --disable-libelf \
        --libdir=/usr/lib
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
