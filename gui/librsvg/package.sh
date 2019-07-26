#!/bin/sh

pkgname=librsvg
#FIXME 2.41+ cannot be built without rust, cargo and network
SKIP_ARCH_CHECK=1
pkgver=2.40.20
vcs=git
gittag=${pkgver}
#relmon_id=5420

build() {
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

package() {
    make DESTDIR=${pkgdir} install
}

after_install() {
    gdk-pixbuf-query-loaders --update-cache
}

after_upgrade() {
    after_install
}
