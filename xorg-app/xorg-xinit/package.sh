#!/bin/sh

_pkgname=xinit
pkgname=xorg-${_pkgname}
pkgver=1.3.4
vcs="git"
gittag=xinit-${pkgver}
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  NOCONFIGURE=1 ./autogen.sh
  ./configure $XORG_CONFIG \
    --with-xinitdir=/etc/X11/app-defaults
  make
  sed -i -e "s/xserverauthfile=\$HOME\/\.serverauth\.\$\$$/xserverauthfile=\$XAUTHORITY; touch \$XAUTHORITY/g" startx
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
