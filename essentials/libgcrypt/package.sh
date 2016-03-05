#!/bin/sh

pkgname=libgcrypt
pkgver=1.6.5
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  if [ -n "${KIIN_LIB32}" ]; then
    sed 's:path="amd64":path="i586 i386":' -i mpi/config.links
  fi
  ./configure --prefix=/usr --libdir=${LIBDIR}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
