#!/bin/sh

pkgname=kmod
ARCH_NAME_LIB32=kmod
pkgver=18
urls="http://www.kernel.org/pub/linux/utils/kernel/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-xz \
              --with-zlib \
              --libdir=${LIBDIR}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} pkgconfigdir=/usr/lib/pkgconfig install
  for target in depmod insmod modinfo modprobe rmmod; do
    ln -sv kmod ${pkgdir}/usr/bin/${target}
  done
  ln -sv kmod ${pkgdir}/usr/bin/lsmod
  if [ -n "${KIIN_LIB32}" ]; then
    mv ${pkgdir}/usr/lib/* ${pkgdir}/usr/lib32
    rm -rf ${pkgdir}/usr/lib
  fi
}
