#!/bin/sh

pkgname=pango
majorver=1.40
pkgver=${majorver}.6
ARCH_VERSION=1.40.6+9+g92cc73c8
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1
relmon_id=11783

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
