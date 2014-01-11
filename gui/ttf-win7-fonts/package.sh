#!/bin/sh

pkgname=ttf-win7-fonts
SKIP_ARCH_CHECK=1
pkgver=7.1
urls="got-from-windows7-installation/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  install -d -m 755 ${pkgdir}/usr/share/fonts/TTF
  install -m 644 *.ttf ${pkgdir}/usr/share/fonts/TTF
}

kiin_after_install() {
  fc-cache -f > /dev/null
  mkfontscale /usr/share/fonts/TTF
  mkfontdir /usr/share/fonts/TTF
}

kiin_after_upgrade() {
  kiin_after_install
}
