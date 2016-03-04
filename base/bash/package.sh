#!/bin/sh

pkgname=bash
pkgver=4.3.042
vcs=git
gittag=ae339e9c3c855a2bbd8f8667d4cf2999e3f06bfa
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
