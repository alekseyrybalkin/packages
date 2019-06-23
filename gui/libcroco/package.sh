#!/bin/sh

pkgname=libcroco
pkgver=0.6.13
vcs=git
gittag=${pkgver}
urls="http://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=11787

kiin_make() {
    # disable gtk-doc
    sed -i -e '/gtkdocize/d' autogen.sh
    sed -i -e '/docs/d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/docs tests/tests/g' Makefile.am
    rm -rf docs

    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
