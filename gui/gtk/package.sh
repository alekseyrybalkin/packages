#!/bin/sh

pkgname=gtk
ARCH_NAME=gtk3
majorver=3.24
pkgver=${majorver}.9
vcs=git
gittag=${pkgver}
# development versions
#relmon_id=10018

kiin_make() {
    # disable accessibility
    sed -i -e '/bridge/d' gtk/a11y/gtkaccessibility.c
    sed -i -e 's/atkbridge_dep,//g' gtk/meson.build
    sed -i -e '/atkbridge_dep/d' meson.build

    meson --prefix=/usr \
        -D libexecdir=/usr/lib \
        -D sysconfdir=/etc \
        -D colord=no \
        -D gtk_doc=false \
        -D man=true \
        -D broadway_backend=true \
        -D wayland_backend=false \
        . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}

kiin_after_install() {
    gtk-query-immodules-3.0 --update-cache
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/lib/gtk-3.0/3.0.0/immodules.cache"
