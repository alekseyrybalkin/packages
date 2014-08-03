#!/bin/sh

pkgname=util-linux
pkgver=2.25
urls="http://www.kernel.org/pub/linux/utils/${pkgname}/v2.25/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --without-udev \
      --bindir=/usr/bin \
      --libdir=/usr/lib \
      --without-python \
      ADJTIME_PATH=/var/lib/hwclock
    make
  else
    ./configure --without-ncurses \
      --libdir=/usr/lib32 \
      --without-python \
      ADJTIME_PATH=/var/lib/hwclock
    make lib{uuid,blkid,mount}.la
  fi
}

kiin_install() {
  if [ -z "$KIIN_LIB32" ]; then
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/{sbin,usr/sbin}/* ${pkgdir}/usr/bin
    rmdir ${pkgdir}/{sbin,usr/sbin}
  else
    make DESTDIR=${pkgdir} \
    install-usrlib_execLTLIBRARIES \
    install-pkgconfigDATA
  fi
}
