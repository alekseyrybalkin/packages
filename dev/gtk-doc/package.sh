#!/bin/sh

pkgname=gtk-doc
pkgver=1.26
vcs=git
gittag=GTK_DOC_${pkgver//\./_}
urls="http://ftp.gnome.org/pub/gnome/sources/gtk-doc/${pkgver}/gtk-doc-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=13140

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
