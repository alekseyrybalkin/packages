#!/bin/sh

pkgname=freeciv
pkgver=2.4.1
urls="http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-client=gtk2 \
    --enable-shared \
    --enable-fcdb=sqlite3 \
    --enable-aimodules \
    --without-ggz-client
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  chmod 700 /usr/bin/freeciv-{gtk2,manual,modpack,server}
  getent group gamer >/dev/null || groupadd gamer
  getent passwd gamer >/dev/null || \
    useradd -m -g gamer -G audio,video -s /bin/bash gamer
  chown gamer:gamer /usr/bin/freeciv-{gtk2,manual,modpack,server}
}

kiin_after_upgrade() {
  kiin_after_install
}
