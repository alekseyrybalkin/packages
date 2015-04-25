#!/bin/sh

pkgname=mutt
pkgver=1.5.23
urls="ftp://ftp.mutt.org/mutt/mutt-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-docdir=/usr/share/doc/mutt-${pkgver} \
    --enable-pop --enable-imap \
    --enable-hcache --without-qdbm \
    --without-tokyocabinet \
    --with-gdbm --without-bdb --with-ssl
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  getent group mail >/dev/null || groupadd -g 34 mail
  chgrp -v mail /var/mail
}

kiin_after_upgrade() {
  kiin_after_install
}
