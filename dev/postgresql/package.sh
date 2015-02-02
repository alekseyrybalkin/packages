#!/bin/sh

pkgname=postgresql
pkgver=9.4.0
extension=bz2
folder="http://ftp.postgresql.org/pub/source/"
check_server=1

. ${KIIN_REPO}/defaults.sh

urls="${folder}v${pkgver}/${srctar}"
ver_grep="^v[0-9\.]+$"
ver_seds() {
  sed -r "s/v//g"
}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-thread-safety \
    --with-system-tzdata=/usr/share/zoneinfo \
    --docdir=/usr/share/doc/postgresql
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make -C contrib DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install-docs
  mkdir -p ${pkgdir}/etc/postgresql
  echo '\set HISTFILE /dev/null' > ${pkgdir}/etc/postgresql/psqlrc
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
