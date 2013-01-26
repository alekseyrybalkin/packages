#!/bin/sh

pkgname=steam
pkgver=1.0.0.22
urls="http://media.steampowered.com/client/installer/steam.deb"

kiin_make() {
  ar -x steam.deb
  tar xvf data.tar.gz
}

kiin_install() {
  cp -dpr --no-preserve=ownership usr ${pkgdir}
  ln -sf /bin/true ${pkgdir}/usr/bin/steamdeps
  rm -rf etc usr control.tar.gz data.tar.gz debian-binary
}
