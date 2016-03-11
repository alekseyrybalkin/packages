#!/bin/sh

pkgname=inkscape
pkgver=0.91
urls="https://launchpad.net/inkscape/${pkgver}.x/${pkgver}/+download/inkscape-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  CXXFLAGS="${CXXFLAGS} -std=c++11" ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  update-desktop-database -q
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

kiin_after_upgrade() {
  kiin_after_install
}
