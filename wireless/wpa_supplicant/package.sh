#!/bin/sh

pkgname=wpa_supplicant
pkgver=2.1
urls="http://hostap.epitest.fi/releases/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cp ../config ${pkgname}/.config
  cd ${pkgname}
  make BINDIR=/usr/bin LIBDIR=/lib
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/man/man5
  mkdir -p ${pkgdir}/usr/share/man/man8
  cd ${pkgname}
  install -v -m755 wpa_{cli,passphrase,supplicant} ${pkgdir}/usr/bin
  install -v -m644 doc/docbook/wpa_supplicant.conf.5 ${pkgdir}/usr/share/man/man5
  install -v -m644 doc/docbook/wpa_{cli,passphrase,supplicant}.8 ${pkgdir}/usr/share/man/man8
}
