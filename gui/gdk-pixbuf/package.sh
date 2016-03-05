#!/bin/sh

pkgname=gdk-pixbuf
ARCH_NAME=gdk-pixbuf2
majorver=2.33
pkgver=${majorver}.2
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    ./autogen.sh --prefix=/usr --with-x11 --libdir=$LIBDIR
  else
    ./autogen.sh --prefix=/usr --with-x11 --libdir=$LIBDIR \
      --with-included-loaders=png
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "${KIIN_LIB32}" ]; then
    mv ${pkgdir}/usr/bin/gdk-pixbuf-query-loaders \
      ${pkgdir}/usr/lib32/gdk-pixbuf-2.0
  fi
}

kiin_after_install() {
  gdk-pixbuf-query-loaders --update-cache
  if [ -f /usr/lib32/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders ]; then
    /usr/lib32/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
  fi
}

kiin_after_upgrade() {
  kiin_after_install
}

known="usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache \
  usr/lib32/gdk-pixbuf-2.0/2.10.0/loaders.cache"
