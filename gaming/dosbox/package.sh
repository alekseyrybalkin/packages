#!/bin/sh

pkgname=dosbox
pkgver=0.74
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '30a#include <stddef.h> //for offsetof' include/dos_inc.h
  ./configure --prefix=/usr --sysconfdir=/etc/dosbox
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 docs/README.video ${pkgdir}/usr/share/doc/${pkgname}/README.video
}

kiin_after_install() {
  getent group saruman >/dev/null || groupadd saruman
  getent passwd saruman >/dev/null || \
    useradd -m -g saruman -G audio,video -s /bin/bash saruman
}

kiin_after_upgrade() {
  kiin_after_install
}
