#!/bin/sh

pkgname=glib
majorver=2.37
pkgver=${majorver}.6
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  # https://bugs.archlinux.org/task/34630
  export CFLAGS+=" -Wall"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-pcre=system \
              --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
