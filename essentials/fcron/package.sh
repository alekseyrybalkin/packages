#!/bin/sh

pkgname=fcron
pkgver=3.2.1
vcs=git
gittag=adea4b8bfbb82a8c5faf3da9c6b3a82a43eedf0b
urls="http://fcron.free.fr/archives/fcron-${pkgver}.src.tar.gz"
srctar=${pkgname}-${pkgver}.src.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/^documentation/d' Makefile.in
  sed -i -e 's/documentation//g' Makefile.in
  sed -i -e '/^updatedoc/d' Makefile.in
  sed -i -e 's/updatedoc//g' Makefile.in
  sed -i -e '/doc-if-none/d' Makefile.in
  sed -i -e '/-C doc/d' Makefile.in
  autoconf
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --without-sendmail \
    --with-boot-install=no \
    --with-systemdsystemunitdir=no \
    --with-db2man=no \
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
