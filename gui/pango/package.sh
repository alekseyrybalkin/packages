#!/bin/sh

pkgname=pango
majorver=1.42
pkgver=${majorver}.0
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1
relmon_id=11783

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    # disable gtk-doc
    sed -i -e 's/gtkdocize/true/g' autogen.sh
    sed -i -e '/docs/d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/examples docs/examples/g' Makefile.am
    rm -rf docs

    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
