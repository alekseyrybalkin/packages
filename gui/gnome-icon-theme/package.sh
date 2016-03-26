#!/bin/sh

pkgname=gnome-icon-theme
majorver=3.12
pkgver=${majorver}.0
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr --datadir=/usr/share
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/share
  mv ${pkgdir}/usr/locale ${pkgdir}/usr/share/
}

kiin_after_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/gnome
}

kiin_after_upgrade() {
  kiin_after_install
}

known="usr/share/icons/gnome/icon-theme.cache"
