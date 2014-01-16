#!/bin/sh

pkgname=glib
ARCH_NAME=glib2
majorver=2.38
pkgver=${majorver}.2
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  # https://bugs.archlinux.org/task/34630
  export CFLAGS+=" -Wall"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-pcre=system \
              --disable-libelf \
              --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
