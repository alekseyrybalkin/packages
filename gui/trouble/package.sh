#!/bin/sh

pkgname=trouble
SKIP_ARCH_CHECK=1
vcs="git"
pkgver=1.0.0
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  g++ `pkg-config --libs --cflags webkit2gtk-3.0` -std=c++11 trouble.cpp -o trouble
}

kiin_install() {
  mkdir -p ${pkgdir}/{usr/bin,usr/lib/trouble}
  cp trouble.bash ${pkgdir}/usr/bin/trouble
  cp trouble style.css ${pkgdir}/usr/lib/trouble
}
