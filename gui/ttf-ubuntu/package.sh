#!/bin/sh

pkgname=ttf-ubuntu
ARCH_NAME=ttf-ubuntu-font-family
pkgver=0.80
urls="http://font.ubuntu.com/download/ubuntu-font-family-${pkgver}.zip"
srczip=ubuntu-font-family-${pkgver}.zip
srcdir=${location}/ubuntu-font-family-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  install -m755 -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 Ubuntu-{L,R,B,C}*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -m644 UbuntuMono-*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

kiin_after_install() {
  fc-cache -fs > /dev/null
  mkfontscale /usr/share/fonts/TTF
  mkfontdir /usr/share/fonts/TTF
}

kiin_after_upgrade() {
  kiin_after_install
}
