#!/bin/sh

pkgname=util-linux
pkgver=2.22.1
urls="http://www.kernel.org/pub/linux/utils/${pkgname}/v2.22/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's@etc/adjtime@var/lib/hwclock/adjtime@g' \
      $(grep -rl '/etc/adjtime' .)
  ./configure --without-udev \
    --disable-su \
    --disable-sulogin \
    --disable-login
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
