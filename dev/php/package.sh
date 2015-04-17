#!/bin/sh

pkgname=php
pkgver=5.6.8
urls="http://us2.php.net/distributions/php-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --datadir=/usr/share/php \
    --mandir=/usr/share/man \
    --enable-fpm \
    --with-fpm-user=${PACMAN} \
    --with-fpm-group=${PACMAN} \
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
    --with-mysql=shared,mysqlnd \
    --with-mysqli=shared,mysqlnd \
    --with-mysql-sock=/var/run/mysqld/mysqld.sock \
    --with-pdo-mysql=shared,mysqlnd \
    --with-readline \
    --with-curl=shared
  make
}

kiin_install() {
  make -j1 INSTALL_ROOT=${pkgdir} install
  install -v -m644 php.ini-production ${pkgdir}/etc/php.ini.packaged
  mv -v ${pkgdir}/etc/php-fpm.conf{.default,}
  sed -i 's@php/includes"@&\ninclude_path = ".:/usr/lib/php"@' \
    ${pkgdir}/etc/php.ini.packaged
  rm -rf ${pkgdir}/{var,.channels,.registry,.depdb,.depdblock,.filemap,.lock}
  rm ${pkgdir}/usr/bin/phar
  ln -sv phar.phar ${pkgdir}/usr/bin/phar
}
