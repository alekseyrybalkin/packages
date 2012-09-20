#!/bin/sh

pkgname=screen
pkgver=4.0.3
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr                     \
              --with-socket-dir=/var/run/screen \
              --with-pty-group=5                \
              --with-sys-screenrc=/etc/screenrc
  sed -i -e "s%/usr/local/etc/screenrc%/etc/screenrc%" {etc,doc}/*
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -m 644 etc/etcscreenrc ${pkgdir}/etc/screenrc
}
