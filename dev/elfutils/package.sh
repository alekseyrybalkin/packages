#!/bin/sh

pkgname=elfutils
vcs=git
gittag=24b26ec1aaf4dc87d274f1786a1ad83b3ec2ba25
pkgver=0.155+
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -fi
  ./configure --prefix=/usr \
    --program-prefix="eu-" \
    --enable-maintainer-mode
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
