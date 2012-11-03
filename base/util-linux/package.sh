#!/bin/sh

pkgname=util-linux
pkgver=2.22.1
urls="http://www.kernel.org/pub/linux/utils/${pkgname}/v2.22/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's@etc/adjtime@var/lib/hwclock/adjtime@g' \
      $(grep -rl '/etc/adjtime' .)
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --without-udev \
      --disable-su \
      --disable-sulogin \
      --disable-login
    make
  else
    export CC="gcc -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --without-ncurses \
      --libdir=/usr/lib32 \
      --disable-su \
      --disable-sulogin \
      --disable-login
    make lib{uuid,blkid,mount}.la
  fi
}

kiin_install() {
  if [ -z "$KIIN_LIB32" ]; then
    make DESTDIR=${pkgdir} install
  else
    make DESTDIR=${pkgdir} \
    install-usrlib_execLTLIBRARIES \
    install-pkgconfigDATA
  fi
}
