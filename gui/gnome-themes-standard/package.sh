#!/bin/sh

pkgname=gnome-themes-standard

majorver=3.20
pkgver=${majorver}.2
gittag=fe51d709655d8d6c1dd18a45d7c26ea51225d9fa

vcs=git
extension=xz
major_folder="http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/"
check_server=1

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
