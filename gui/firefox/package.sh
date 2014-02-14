#!/bin/sh

pkgname=firefox
pkgver=27.0.1
urls="ftp://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}.source.tar.bz2 \
  http://rybalkin.org/kiin-files/firefox-fixed-loading-icon.png"
srctar=${pkgname}-${pkgver}.source.tar.bz2
srcdir=${location}/mozilla-release

kiin_make() {
  sed -i -e 's/-\$(MOZ_APP_VERSION)//g' config/baseconfig.mk
  sed -i -e 's/-\$(MOZ_APP_VERSION)//g' js/src/config/baseconfig.mk
  CFLAGS="${CFLAGS} -mno-avx"
  CXXFLAGS="${CFLAGS}"
  cp ../mozconfig .
  cp ${KIIN_HOME}/tarballs/firefox-fixed-loading-icon.png \
    browser/themes/linux/tabbrowser/loading.png
  sed -i -e '/MOZ_MAKE_FLAGS/d' mozconfig
  echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig
  sed -i 's@ ""@@' browser/base/Makefile.in
  make -f client.mk
}

kiin_install() {
  make -C firefox-build-dir DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/bin
  ln -sfv ../lib/firefox/firefox ${pkgdir}/usr/bin
  ln -sfv ../xulrunner-${pkgver} ${pkgdir}/usr/lib/firefox/xulrunner
  mkdir -pv ${pkgdir}/usr/lib/mozilla/plugins
  ln -sfv ../mozilla/plugins ${pkgdir}/usr/lib/firefox
}
