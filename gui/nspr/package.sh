#!/bin/sh

pkgname=nspr
pkgver=4.9.5
urls="http://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${pkgver}/src/nspr-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cd mozilla/nsprpub
  sed -ri 's#^(RELEASE_BINS =).*#\1#' pr/src/misc/Makefile.in
  sed -i 's#$(LIBRARY) ##' config/rules.mk
  ./configure --prefix=/usr \
    --with-mozilla \
    --with-pthreads \
    $([ -z "$KIIN_LIB32" ] && echo --enable-64bit) \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  cd mozilla/nsprpub
  make DESTDIR=${pkgdir} install
}
