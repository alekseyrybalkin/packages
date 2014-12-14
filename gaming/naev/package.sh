#!/bin/sh

pkgname=naev
vcs="git"
pkgver=0.5.3
gittag=${pkgname}-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  LIBS="-lm -lvorbis" ./configure --prefix=/usr --disable-debug --disable-shave
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  chmod 700 /usr/bin/naev
  getent group gamer >/dev/null || groupadd gamer
  getent passwd gamer >/dev/null || \
    useradd -m -g gamer -G audio,video -s /bin/bash gamer
  chown gamer:gamer /usr/bin/naev
}

kiin_after_upgrade() {
  kiin_after_install
}
