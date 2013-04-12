#!/bin/sh

pkgname=firefox
pkgver=20.0.1
urls="ftp://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}.source.tar.bz2"
srctar=${pkgname}-${pkgver}.source.tar.bz2
srcdir=${location}/mozilla-release

kiin_make() {
  cp ../mozconfig .
  sed -i -e '/MOZ_MAKE_FLAGS/d' mozconfig
  echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig
  sed -i 's# ""##' browser/base/Makefile.in
  make -f client.mk
}

kiin_install() {
  make -C firefox-build-dir DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/bin
  ln -sfv ../lib/firefox-${pkgver}/firefox ${pkgdir}/usr/bin
  ln -sfv ../xulrunner-${pkgver} ${pkgdir}/usr/lib/firefox-${pkgver}/xulrunner
  mkdir -pv ${pkgdir}/usr/lib/mozilla/plugins
  ln -sfv ../mozilla/plugins ${pkgdir}/usr/lib/firefox-${pkgver}
}
