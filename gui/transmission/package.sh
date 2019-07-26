#!/bin/sh

pkgname=transmission
pkgver=2.94
vcs=git
gittag=${pkgver}
relmon_id=5002

build() {
    sed -i -e '/gtr_get_favicon/d' gtk/details.c
    sed -i -e '/gtr_get_favicon/d' gtk/filter.c
    rm m4/glib-gettext.m4
    ./autogen.sh --prefix=/usr --enable-cli --with-gtk
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
