#!/bin/sh

pkgname=wpa_supplicant
pkgver=2.4
vcs=git
gittag=hostap_2_4
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git cherry-pick 9ed4eee345f85e3025c33c6e20aa25696e341ccd
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
