#!/bin/sh

pkgname=util-linux
pkgver=2.24.1
urls="http://www.kernel.org/pub/linux/utils/${pkgname}/v2.24/${pkgname}-${pkgver}.tar.xz \
  http://rybalkin.org/kiin-files/0001-switch_root-verify-initramfs-by-f_type-not-devno.patch"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -p1 -i ${KIIN_HOME}/tarballs/0001-switch_root-verify-initramfs-by-f_type-not-devno.patch
  sed -i -e 's@etc/adjtime@var/lib/hwclock/adjtime@g' \
      $(grep -rl '/etc/adjtime' .)
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --without-udev \
      --bindir=/usr/bin \
      --libdir=/usr/lib
    make
  else
    ./configure --without-ncurses \
      --libdir=/usr/lib32
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
