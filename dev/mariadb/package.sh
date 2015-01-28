#!/bin/sh

pkgname=mariadb
pkgver=10.0.16
urls="https://downloads.mariadb.org/interstitial/mariadb-${pkgver}/source/mariadb-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i "s@data/test@\${INSTALL_MYSQLTESTDIR}@g" sql/CMakeLists.txt
  sed -i "s/srv_buf_size/srv_sort_buf_size/" storage/innobase/row/row0log.cc
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_DOCDIR=share/doc/mariadb \
    -DINSTALL_DOCREADMEDIR=share/doc/mariadb \
    -DINSTALL_MANDIR=share/man \
    -DINSTALL_MYSQLSHAREDIR=share/mysql \
    -DINSTALL_MYSQLTESTDIR=share/mysql/test \
    -DINSTALL_PLUGINDIR=lib/mysql/plugin \
    -DINSTALL_SBINDIR=bin \
    -DINSTALL_SCRIPTDIR=bin \
    -DINSTALL_SQLBENCHDIR=share/mysql/bench \
    -DINSTALL_SUPPORTFILESDIR=share/mysql \
    -DMYSQL_DATADIR=/var/lib/mysql \
    -DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock \
    -DWITH_EXTRA_CHARSETS=complex \
    -DWITH_EMBEDDED_SERVER=ON \
    -DTOKUDB_OK=0 \
    ..
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/share/mysql/test
}

kiin_after_install() {
  install -v -m700 -d /var/lib/mysql
  getent group mysql >/dev/null || groupadd -g 40 mysql
  getent passwd mysql >/dev/null || \
    useradd -c "MySQL Server" -g mysql -d /var/lib/mysql \
    -s /bin/false -u 40 mysql
  chown -v mysql /var/lib/mysql
  mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql
  chown -R mysql:mysql /var/lib/mysql
}

kiin_after_upgrade() {
  :
}
