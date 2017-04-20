#!/bin/sh

pkgname=librsvg
majorver=2.41
pkgver=${majorver}.0
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    export CARGO_HOME=${KIIN_HOME}/tarballs/cargo
    ./autogen.sh --prefix=/usr \
        --disable-static \
        --disable-introspection
    make
}

kiin_install() {
    export CARGO_HOME=${KIIN_HOME}/tarballs/cargo
    make DESTDIR=${pkgdir} install
}

kiin_after_install() {
    gdk-pixbuf-query-loaders --update-cache
}

kiin_after_upgrade() {
    kiin_after_install
}
