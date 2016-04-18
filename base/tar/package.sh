#!/bin/sh

pkgname=tar
pkgver=1.28
vcs=git
gittag=release_${pkgver//\./_}
urls="http://ftp.gnu.org/gnu/tar/tar-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git clone ${KIIN_HOME}/sources/gnulib
  git clone ${KIIN_HOME}/sources/paxutils
  # use `file-has-acl` (instead of `acl`) gnulib module
  git cherry-pick d95457e0071f26b1e524c754adf211abdd53d0fa
  ./bootstrap
  ./configure --prefix=/usr --enable-gcc-warnings=no --libexecdir=/usr/bin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar
}
