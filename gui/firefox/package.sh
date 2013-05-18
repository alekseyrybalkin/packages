#!/bin/sh

pkgname=firefox
pkgver=21.0
urls="ftp://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}.source.tar.bz2 \
  http://rybalkin.org/kiin-files/firefox-fixed-loading-icon.png"
srctar=${pkgname}-${pkgver}.source.tar.bz2
srcdir=${location}/mozilla-release

kiin_make() {
  cp ../mozconfig .
  cp ../firefox-fixed-loading-icon.png \
    browser/themes/gnomestripe/tabbrowser/loading.png
  sed -i -e '/MOZ_MAKE_FLAGS/d' mozconfig
  echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig
  sed -i 's@ ""@@' browser/base/Makefile.in
  sed -i "/gre_path/s@DIST'\]@& + '/bin'@" toolkit/mozapps/installer/packager.py
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
