#!/bin/sh

pkgname=php
pkgver=5.6.2
urls="http://us2.php.net/distributions/php-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --datadir=/usr/share/php \
    --mandir=/usr/share/man \
    --with-config-file-path=/etc \
    --with-zlib \
    --enable-bcmath \
    --with-bz2 \
    --enable-calendar \
    --enable-dba=shared \
    --with-gdbm \
    --with-gmp \
    --enable-ftp \
    --with-gettext \
    --enable-mbstring \
    --with-readline
  make
}

kiin_install() {
  make -j1 INSTALL_ROOT=${pkgdir} install
  rm -rf ${pkgdir}/{var,.channels,.registry,.depdb,.depdblock,.filemap,.lock}
}
