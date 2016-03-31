#!/bin/sh

pkgname=mpv
vcs=git
pkgver=0.16.0
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cp -r ${KIIN_HOME}/sources/waf/{waf-light,waflib} ./
  mv ./waf{-light,}
  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --disable-pulse \
    --enable-libmpv-shared
  ./waf build
}

kiin_install() {
  ./waf install --destdir=${pkgdir}
}
