#!/bin/sh

pkgname=gnome-themes-standard

majorver=3.22
pkgver=${majorver}.3
ARCH_VERSION=3.22.3+13+ga993fdc0
gittag=${pkgver}

vcs=git
extension=xz
major_folder="http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/"
check_server=1
relmon_id=10894

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
    ./autogen.sh --disable-gtk2-engine
    ./configure --disable-gtk2-engine --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
