#!/bin/sh

#vcs=git
#git_repo=git://anongit.freedesktop.org/harfbuzz
#git_problem="requires ragel"
pkgname=harfbuzz
pkgver=1.2.4
extension=bz2
folder="http://www.freedesktop.org/software/${pkgname}/release/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    ./configure --prefix=/usr --libdir=$LIBDIR
  else
    ./configure --prefix=/usr --with-icu=no --with-cairo=no --libdir=$LIBDIR
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
