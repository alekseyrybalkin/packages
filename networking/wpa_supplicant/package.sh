#!/bin/sh

pkgname=wpa_supplicant
pkgver=2.5
vcs=git
gittag=hostap_${pkgver//\./_}
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
}
