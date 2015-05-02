#!/bin/sh

pkgname=acpi
pkgver=1.7
vcs=git
git_repo=git://git.code.sf.net/p/acpiclient/code
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
