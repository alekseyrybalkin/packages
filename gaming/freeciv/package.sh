#!/bin/sh

pkgname=freeciv
pkgver=2.5.0
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
  getent group bilbo >/dev/null || groupadd bilbo
  getent passwd bilbo >/dev/null || \
    useradd -m -g bilbo -G audio,video -s /bin/bash bilbo
  chmod 700 /usr/bin/freeciv-{gtk2,manual,mp-gtk2,server}
  chown bilbo:bilbo /usr/bin/freeciv-{gtk2,manual,mp-gtk2,server}
}

kiin_after_upgrade() {
  kiin_after_install
}
