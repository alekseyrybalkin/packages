#!/bin/sh

pkgname=util-linux
pkgver=2.26.1
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --without-udev \
      --bindir=/usr/bin \
      --libdir=/usr/lib \
      --without-python \
      ADJTIME_PATH=/var/lib/hwclock/adjtime
    make
  else
    ./configure --without-ncurses \
      --libdir=/usr/lib32 \
      --without-python \
      ADJTIME_PATH=/var/lib/hwclock/adjtime
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
