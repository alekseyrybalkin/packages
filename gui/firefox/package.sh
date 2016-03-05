#!/bin/sh

pkgname=firefox
pkgver=44.0.2
urls="https://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}.source.tar.xz"
srctar=${pkgname}-${pkgver}.source.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  export PYTHON="/usr/bin/python2"
  CFLAGS="${CFLAGS} -mno-avx"
  CXXFLAGS="${CFLAGS}"
  cp ../mozconfig .
  cp ../firefox-fixed-loading-icon.png \
    browser/themes/linux/tabbrowser/loading.png
  sed -i -e '/MOZ_MAKE_FLAGS/d' mozconfig
  echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig

  # WebRTC build tries to execute "python" and expects Python 2
  mkdir path
  ln -s /usr/bin/python2 "$srcdir/path/python"

  make -f client.mk
}

kiin_install() {
  make -C firefox-build-dir DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/lib/mozilla/plugins
}
