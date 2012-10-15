#!/bin/sh

pkgname=tmux
vcs="git"
gittag=1.7
pkgver=`echo ${gittag} | sed 's/^v//g' | sed 's/-/\./g'`
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
