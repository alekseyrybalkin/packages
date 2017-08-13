#!/bin/sh

pkgname=gdk-pixbuf
ARCH_NAME=gdk-pixbuf2
majorver=2.36
pkgver=${majorver}.8
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1
relmon_id=9533

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    # disable gtk-doc
    sed -i -e 's/gtkdocize/true/g' autogen.sh
    sed -i -e '/docs/d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/po docs/po/g' Makefile.am
    rm -rf docs

    ./autogen.sh --prefix=/usr --with-x11 --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

kiin_after_install() {
    gdk-pixbuf-query-loaders --update-cache
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
