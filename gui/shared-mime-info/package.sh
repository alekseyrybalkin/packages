#!/bin/sh

pkgname=shared-mime-info
pkgver=1.5
urls="http://freedesktop.org/~hadess/shared-mime-info-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  export ac_cv_func_fdatasync=no
  ./configure --prefix=/usr
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  update-mime-database -n /usr/share/mime
}

kiin_after_upgrade() {
  kiin_after_install
}

known="usr/share/applications/mimeinfo.cache"
