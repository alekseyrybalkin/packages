#!/bin/sh

pkgname=evince
pkgver=3.24.0
ARCH_VERSION=3.24.0+12+g717df38f
vcs=git
git_repo=git://git.gnome.org/evince
gittag=${pkgver}
relmon_id=8178

kiin_make() {
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
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/usr/share/help
}

kiin_after_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
    update-desktop-database -q
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

kiin_after_upgrade() {
    kiin_after_install
}
