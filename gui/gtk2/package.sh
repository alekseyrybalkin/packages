#!/bin/sh

pkgname=gtk2
pkgver=2.24.32
vcs=git
vcs_pkgname=gtk
gittag=${pkgver}
relmon_id=13942

kiin_make() {
    rm -rf docs
    sed -i -e '/docs\//d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/automake-1.15/automake-1.16/g' autogen.sh
    sed -i -e 's/aclocal-1.15/aclocal-1.16/g' autogen.sh
    sed -i -e 's/gtkdocize/true/g' autogen.sh
    sed -i -e 's/docs //g' Makefile.am
    sed -i -e '/gtk-doc.make/d' Makefile.am
    NOCONFIGURE=1 ./autogen.sh
    sed -i -e 's/docs //g' Makefile.am
    sed -i -e '/gtk-doc.make/d' Makefile.am Makefile.in

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --disable-gtk-doc \
        --disable-gtk-doc-html \
        --disable-gtk-doc-pdf \
        --disable-man \
        --disable-cups \
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
