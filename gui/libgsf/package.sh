#!/bin/sh

pkgname=libgsf
pkgver=1.14.41
ARCH_VERSION=1.14.41+3+gc7b4b53
vcs=git
git_repo=git://git.gnome.org/libgsf
gittag=LIBGSF_${pkgver//\./_}
relmon_id=1980

kiin_make() {
    # disable gtk-doc
    sed -i -e '/gtkdocize/d' autogen.sh
    sed -i -e '/gtk_doc/d' configure.ac
    sed -i -e '/GTK_DOC/d' configure.ac
    sed -i -e '/doc\//d' configure.ac
    sed -i -e 's/doc tools/tools/g' Makefile.am
    rm -rf doc

    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
