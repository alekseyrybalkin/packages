#!/bin/sh

pkgname=gtk2
pkgver=2.24.31
vcs=git
vcs_pkgname=gtk+
gittag=${pkgver}
srcdir=${location}/gtk+-${pkgver}

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --disable-gtk-doc \
        --disable-gtk-doc-html \
        --disable-gtk-doc-pdf \
        --disable-man \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    # fix conflict with gtk3
    mv ${pkgdir}/usr/bin/gtk{,2}-update-icon-cache
}

kiin_after_install() {
    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
}

kiin_after_upgrade() {
    kiin_after_install
}

known="etc/gtk-2.0/gtk.immodules"
