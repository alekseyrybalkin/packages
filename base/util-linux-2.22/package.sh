#!/bin/sh

pkgname=util-linux
pkgver=2.22
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's@etc/adjtime@var/lib/hwclock/adjtime@g' \
      $(grep -rl '/etc/adjtime' .)
  #mkdir -pv /var/lib/hwclock
  ./configure --disable-su --disable-sulogin --disable-login
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
