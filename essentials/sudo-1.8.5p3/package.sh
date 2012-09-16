#!/bin/sh

pkgname=sudo
pkgver=1.8.5p3
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr                   \
              --libexecdir=/usr/lib/sudo      \
              --docdir=/usr/share/doc/sudo-1.8.5p3 \
              --with-all-insults              \
              --with-env-editor               \
              --without-pam                   \
              --without-sendmail
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
