#!/bin/sh

pkgname=bash
pkgver=4.3.033
vcs=git
gittag=84c617ecf0f06d4df1c3951504bb0d668c990e58
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --htmldir=/usr/share/doc/bash \
    --without-bash-malloc \
    --with-installed-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sv bash ${pkgdir}/usr/bin/sh
}
