#!/bin/sh

pkgname=gnome-themes-standard

majorver=3.28
pkgver=${majorver}
gittag=${pkgver}

vcs=git
extension=xz
major_folder="http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/"
check_server=1
relmon_id=10894

. ${UNDEAD_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

undead_make() {
    ./autogen.sh --disable-gtk2-engine
    ./configure --disable-gtk2-engine --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
