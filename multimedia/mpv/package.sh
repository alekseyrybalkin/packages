#!/bin/sh

pkgname=mpv
vcs="git"
pkgver=0.7.1
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
  install -d ${pkgdir}/usr/share/doc/mpv/examples
  install -m644 etc/{input,example}.conf \
    ${pkgdir}/usr/share/doc/mpv/examples
  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    ${pkgdir}/usr/share/doc/mpv
}
