#!/bin/sh

pkgname=pango
majorver=1.40
pkgver=${majorver}.5
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
