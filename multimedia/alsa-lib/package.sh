#!/bin/sh

pkgname=alsa-lib
vcs="git"
gittag=v1.0.26
pkgver=`echo ${gittag} | sed 's/^v//g' | sed 's/-/\./g'`
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  libtoolize --force --copy --automake
  aclocal
  autoheader
  automake --foreign --copy --add-missing
  autoconf
  ./configure
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
