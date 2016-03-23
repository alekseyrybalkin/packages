#!/bin/sh

pkgname=atk
majorver=2.20
pkgver=${majorver}.0
vcs=git
gittag=ATK_${pkgver//\./_}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
