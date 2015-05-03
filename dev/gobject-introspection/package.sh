#!/bin/sh

pkgname=gobject-introspection
pkgver=1.44.0
vcs=git
git_repo=git://git.gnome.org/gobject-introspection
gittag=GOBJECT_INTROSPECTION_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
