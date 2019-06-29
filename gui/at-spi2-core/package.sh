#!/bin/sh

pkgname=at-spi2-core
majorver=2.32
pkgver=${majorver}.1
vcs=git
gittag=AT_SPI2_CORE_${pkgver//\./_}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1
relmon_id=7841

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}
