#!/bin/sh

pkgname=fcron
pkgver=3.2.0
urls="http://fcron.free.fr/archives/fcron-${pkgver}.src.tar.gz"
srctar=${pkgname}-${pkgver}.src.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --without-sendmail \
    --with-boot-install=no \
    --with-systemdsystemunitdir=no \
    --with-editor=/usr/bin/vim
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/var
}

kiin_after_install() {
  getent group fcron >/dev/null || groupadd -g 22 fcron
  getent passwd fcron >/dev/null || \
    useradd -c 'fcron user' -d /dev/null -g fcron \
    -s /bin/false -u 22 fcron
}

kiin_after_upgrade() {
  kiin_after_install
}
