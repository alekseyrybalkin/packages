#!/bin/sh

pkgname=firefox
pkgver=16.0.1
urls="ftp://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}.source.tar.bz2"
srctar=${pkgname}-${pkgver}.source.tar.bz2
srcdir=${location}/mozilla-release

kiin_make() {
  cp ../mozconfig .
  sed -i 's/\(MOZ_PKG_FATAL_WARNINGS =\).*/\1 0/' \
    browser/installer/Makefile.in
  sed -i 's# ""##' browser/base/Makefile.in
  make -f client.mk
  make -C firefox-build-dir/browser/installer
}

kiin_install() {
  mkdir -pv ${pkgdir}/usr/lib/${pkgname}-${pkgver}
  tar -xvf firefox-build-dir/dist/${pkgname}-${pkgver}.en-US.linux-$(uname -m).tar.bz2 \
    -C ${pkgdir}/usr/lib/${pkgname}-${pkgver} --strip-components=1
  mkdir -p ${pkgdir}/usr/bin
  ln -sfv ../lib/${pkgname}-${pkgver}/firefox ${pkgdir}/usr/bin
  mkdir -pv ${pkgdir}/usr/lib/mozilla/plugins
  ln -sfv ../mozilla/plugins ${pkgdir}/usr/lib/${pkgname}-${pkgver}
  chown -R -v root:root ${pkgdir}/usr/lib/${pkgname}-${pkgver}
}
