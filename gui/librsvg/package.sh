#!/bin/sh

pkgname=librsvg
pkgver=2.40.17
vcs=git
gittag=${pkgver}
# 2.41.0 cannot be built without network and cargo
#relmon_id=5420

kiin_make() {
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
