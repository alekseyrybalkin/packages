#!/bin/sh

pkgname=gemrb
pkgver=0.8.2
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  getent group elrond >/dev/null || groupadd elrond
  getent passwd elrond >/dev/null || \
    useradd -m -g elrond -G audio,video -s /bin/bash elrond
}

kiin_after_upgrade() {
  kiin_after_install
}
