#!/bin/sh

pkgname=gsettings-desktop-schemas
majorver=3.28
pkgver=${majorver}.0
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1
# rc versions
#relmon_id=13139

. ${UNDEAD_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}

undead_after_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

undead_after_upgrade() {
    undead_after_install
}

known="usr/share/glib-2.0/schemas/gschemas.compiled"
