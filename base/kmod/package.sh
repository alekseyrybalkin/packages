#!/bin/sh

pkgname=kmod
pkgver=11
urls="http://www.kernel.org/pub/linux/utils/kernel/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr       \
              --bindir=/bin       \
              --libdir=/lib       \
              --sysconfdir=/etc   \
              --with-xz           \
              --with-zlib
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} pkgconfigdir=/usr/lib/pkgconfig install
  mkdir -pv ${pkgdir}/{sbin,bin}
  for target in depmod insmod modinfo modprobe rmmod; do
    ln -sv ../bin/kmod ${pkgdir}/sbin/$target
  done
  ln -sv kmod ${pkgdir}/bin/lsmod
}
