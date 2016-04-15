#!/bin/sh

pkgname=alsa-lib
pkgver=1.1.1
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git cherry-pick fdba9e1bad8f769a6137e565471f0227f23a3132
  autoreconf -fi
  ./configure --libdir=$LIBDIR --disable-python
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
