#!/bin/sh

pkgname=freeciv
pkgver=2.5.5
vcs=git-svn
vcs_pkgname=freeciv-git-svn
gittag=origin/tags/R${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --enable-client=gtk2 \
    --enable-shared \
    --enable-fcdb=sqlite3 \
    --enable-aimodules \
    --without-ggz-client
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
