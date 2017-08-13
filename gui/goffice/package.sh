#!/bin/sh

pkgname=goffice
pkgver=0.10.35
vcs=git
git_repo=git://git.gnome.org/goffice
gittag=GOFFICE_${pkgver//\./_}
relmon_id=1226

kiin_make() {
    # disable gtk-doc
    sed -i -e '/gtkdocize/d' autogen.sh
    sed -i -e '/docs/d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/docs tools/tools/g' Makefile.am
    rm -rf docs

    ./autogen.sh --prefix=/usr --disable-gtk-doc --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
