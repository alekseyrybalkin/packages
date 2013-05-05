#!/bin/sh

pkgname=postgresql
pkgver=9.2.4
urls="ftp://ftp5.us.postgresql.org/pub/PostgreSQL/source/v9.2.4/postgresql-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --enable-thread-safety \
    --docdir=/usr/share/doc/postgresql
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install-docs
}

kiin_after_install() {
  install -v -m700 -d /var/lib/postgres/data
  getent group postgres >/dev/null || groupadd -g 41 postgres
  getent passwd postgres >/dev/null || \
    useradd -c "PostgreSQL Server" -g postgres -d /var/lib/postgres/data \
    -u 41 postgres
  chown -v postgres /var/lib/postgres/data
  su - postgres -c '/usr/bin/initdb -D /var/lib/postgres/data'
}

kiin_after_upgrade() {
  :
}
