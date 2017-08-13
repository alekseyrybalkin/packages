#!/bin/sh

pkgname=gnumeric
pkgver=1.12.35
vcs=git
git_repo=git://git.gnome.org/gnumeric
gittag=GNUMERIC_${pkgver//\./_}
relmon_id=1213

kiin_make() {
    # disable gtk-doc
    sed -i -e '/gtkdocize/d' autogen.sh
    sed -i -e '/doc\//d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/doc tools/tools/g' Makefile.am
    rm -rf doc

    cp ../*.make .
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
