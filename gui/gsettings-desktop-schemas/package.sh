#!/bin/sh

pkgname=gsettings-desktop-schemas
majorver=3.33
pkgver=${majorver}.0
vcs=git
gittag=${pkgver}
# rc versions
#relmon_id=13139

kiin_make() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}

kiin_after_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/share/glib-2.0/schemas/gschemas.compiled"
