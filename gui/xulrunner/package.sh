#!/bin/sh

pkgname=xulrunner
pkgver=32.0
urls="https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/source/firefox-${pkgver}.source.tar.bz2"
srctar=firefox-${pkgver}.source.tar.bz2
srcdir=${location}/mozilla-release

kiin_make() {
  CFLAGS="${CFLAGS} -mno-avx"
  CXXFLAGS="${CFLAGS}"
  cp ../mozconfig .
  sed -i -e '/MOZ_MAKE_FLAGS/d' mozconfig
  echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig
  make -f client.mk
}

kiin_install() {
  make -C xulrunner-build-dir DESTDIR=${pkgdir} install

  mkdir -pv ${pkgdir}/usr/lib/mozilla/plugins
  rm -rf ${pkgdir}/usr/lib/xulrunner-${pkgver}/plugins
  ln -sv ../mozilla/plugins ${pkgdir}/usr/lib/xulrunner-${pkgver}

  chmod -v 755 ${pkgdir}/usr/lib/xulrunner-devel-${pkgver}/sdk/bin/xpcshell

  for library in libmozalloc.so libxul.so; do
    ln -sfv ../../../xulrunner-${pkgver}/$library \
      ${pkgdir}/usr/lib/xulrunner-devel-${pkgver}/sdk/lib/$library
    ln -sfv xulrunner-${pkgver}/$library ${pkgdir}/usr/lib/$library
  done

  ln -sfv ../xulrunner-devel-${pkgver}/sdk/bin/run-mozilla.sh \
    ${pkgdir}/usr/lib/xulrunner-${pkgver}
  ln -sfv ../xulrunner-devel-${pkgver}/sdk/bin/xpcshell \
    ${pkgdir}/usr/lib/xulrunner-${pkgver}
}
