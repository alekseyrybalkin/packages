#!/bin/sh

# TODO: use official git repo
pkgname=procps
ARCH_NAME=procps-ng
pkgver=3.3.10
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --exec-prefix=/ \
    --prefix=/usr \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --docdir=/usr/share/doc/${pkgname} \
    --disable-static \
    --disable-kill
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/bin/* ${pkgdir}/usr/bin
  mv ${pkgdir}/sbin/* ${pkgdir}/usr/bin
  rm -rf ${pkgdir}/{bin,sbin}
}
