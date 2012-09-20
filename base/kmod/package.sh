#!/bin/sh

pkgname=kmod
pkgver=9
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../kmod-9-testsuite-1.patch
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
