#!/bin/sh

pkgname=coreutils
pkgver=8.23
urls="http://ftp.gnu.org/gnu/coreutils/coreutils-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-no-install-program=kill,uptime
  make
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/share/man/man8
  make DESTDIR=${pkgdir} install
  mv -v ${pkgdir}/usr/share/man/man1/chroot.1 ${pkgdir}/usr/share/man/man8/chroot.8
  sed -i s/\"1\"/\"8\"/1 ${pkgdir}/usr/share/man/man8/chroot.8
}
