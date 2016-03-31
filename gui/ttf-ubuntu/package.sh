#!/bin/sh

pkgname=ttf-ubuntu
ARCH_NAME=ttf-ubuntu-font-family
pkgver=0.83
_nohinting_ver=0.80
urls="http://font.ubuntu.com/download/ubuntu-font-family-${pkgver}.zip \
    https://launchpad.net/ubuntu-font-mono-nohinting/trunk/${_nohinting_ver}/+download/ubuntu-font-mono-nohinting-${_nohinting_ver}.zip"
srczip=ubuntu-font-family-${pkgver}.zip
srcdir=${location}/ubuntu-font-family-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  unzip ${KIIN_HOME}/tarballs/ubuntu-font-mono-nohinting-${_nohinting_ver}.zip
  install -m755 -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 Ubuntu-{L,R,B,C}*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -m644 UbuntuMono-*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -m644 ubuntu-font-mono-nohinting/UbuntuMonoNohinting-*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

kiin_after_install() {
  fc-cache -fs > /dev/null
  mkfontscale /usr/share/fonts/TTF
  mkfontdir /usr/share/fonts/TTF
}

kiin_after_upgrade() {
  kiin_after_install
}
