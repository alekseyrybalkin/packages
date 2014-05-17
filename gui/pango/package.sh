#!/bin/sh

pkgname=pango
majorver=1.36
pkgver=${majorver}.3
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
  if [ -n "${KIIN_LIB32}" ]; then
    sed -i 's#"pango.modules"#"pango.modules-32"#' pango/modules.c
  fi
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/bin/pango-querymodules ${pkgdir}/usr/lib32/pango
}

kiin_after_install() {
  pango-querymodules --update-cache
  if [ -f /usr/lib32/pango/pango-querymodules ]; then
    /usr/lib32/pango/pango-querymodules > \
      /usr/lib32/pango/1.8.0/modules.cache
  fi
}

kiin_after_upgrade() {
  kiin_after_install
}

known="usr/lib/pango/1.8.0/modules.cache \
  usr/lib32/pango/1.8.0/modules.cache"
