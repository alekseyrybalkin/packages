#!/bin/sh

pkgname=links
pkgver=2.12
extension=bz2
folder="http://${pkgname}.twibright.com/download/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[^-pre]*\.tar\.${extension}$"

kiin_make() {
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -d -m755 ${pkgdir}/usr/share/doc/links-${pkgver}
  install -v -m644 doc/links_cal/* KEYS BRAILLE_HOWTO \
      ${pkgdir}/usr/share/doc/links-${pkgver}
}
