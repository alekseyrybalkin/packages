#!/bin/sh

pkgname=evince
pkgver=3.28.0
vcs=git
git_repo=git://git.gnome.org/evince
gittag=${pkgver}
# beta versions
#relmon_id=8178

undead_make() {
    # disable gtk-doc
    sed -i -e '/help\//d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e '/help$/d' Makefile.am
    sed -i -e 's/po \\$/po/g' Makefile.am
    rm -rf help

    export CFLAGS="${CFLAGS} -Wno-format-y2k -Wno-format-nonliteral"
    ./autogen.sh --prefix=/usr \
        --libexecdir=/usr/lib/evince \
        --disable-introspection \
        --disable-nautilus \
        --without-keyring \
        --disable-dbus \
        --disable-libgnome-desktop \
        --disable-browser-plugin \
        --disable-help \
        --disable-gtk-doc \
        --disable-static
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/usr/share/help
}

undead_after_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
    update-desktop-database -q
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

undead_after_upgrade() {
    undead_after_install
}
