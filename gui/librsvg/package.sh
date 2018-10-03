#!/bin/sh

pkgname=librsvg
# 2.41+ cannot be built without rust, cargo and network
SKIP_ARCH_CHECK=1
pkgver=2.40.20
vcs=git
gittag=${pkgver}
# 2.41+ cannot be built without rust, cargo and network
#relmon_id=5420

kiin_make() {
    # disable gtk-doc
    sed -i -e '/gtkdocize/d' autogen.sh
    sed -i -e '/doc\//d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/doc build/build/g' Makefile.am
    rm -rf doc

    ./autogen.sh --prefix=/usr \
        --disable-static \
        --disable-introspection
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
