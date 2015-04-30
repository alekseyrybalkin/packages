#!/bin/sh

pkgname=findutils
pkgver=4.5.14
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  export DO_NOT_WANT_CHANGELOG_DRIVER=1
  git clone ${KIIN_HOME}/sources/gnulib
  sh import-gnulib.sh
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/findutils \
    --localstatedir=/var/lib/locate
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
