#!/bin/sh

_pkgname=xinit
pkgname=xorg-${_pkgname}
pkgver=1.3.4
urls="http://xorg.freedesktop.org/releases/individual/app/${_pkgname}-${pkgver}.tar.bz2"
srctar=${_pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG \
    --with-xinitdir=/etc/X11/app-defaults
  make
  sed -i -e "s/xserverauthfile=\$HOME\/\.serverauth\.\$\$$/xserverauthfile=\$XAUTHORITY; touch \$XAUTHORITY/g" startx
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
