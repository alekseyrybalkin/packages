#!/bin/sh

pkgname=atk
pkgver=2.28.1
vcs=git
gittag=ATK_${pkgver//\./_}
# development versions
#relmon_id=130

undead_make() {
    # disable gtk-doc
    sed -i -e '/gtkdocize/d' autogen.sh
    sed -i -e '/docs/d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/tests docs po/tests po/g' Makefile.am
    rm -rf docs

    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
