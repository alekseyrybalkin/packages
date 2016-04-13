#!/bin/sh

pkgname=pango
majorver=1.40
pkgver=${majorver}.1
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  if [ -n "${KIIN_LIB32}" ]; then
    sed -i 's#"pango.modules"#"pango.modules-32"#' pango/modules.c
  fi
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -n "${KIIN_LIB32}" ]; then
    mv ${pkgdir}/usr/bin/pango-querymodules ${pkgdir}/usr/lib32/pango
  fi
}
