#!/bin/sh

pkgname=gsettings-desktop-schemas
majorver=3.24
pkgver=${majorver}.0
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1
relmon_id=13139

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

kiin_after_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/share/glib-2.0/schemas/gschemas.compiled"
