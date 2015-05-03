#!/bin/sh

pkgname=goffice
pkgver=0.10.22
vcs=git
git_repo=git://git.gnome.org/goffice
gittag=GOFFICE_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
