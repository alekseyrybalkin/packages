#!/bin/sh

pkgname=gimp
pkgver=2.8.14
vcs=git
git_repo=git://git.gnome.org/gimp
gittag=GIMP_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # fix for automake 1.15
  sed -i -e 's/1\.14/1\.15/g' autogen.sh
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --without-gvfs \
    --without-dbus \
    --with-gimpdir=.config/gimp
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
