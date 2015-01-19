#!/bin/sh

pkgname=djvulibre
pkgver=3.5.26+
vcs=git
gittag=ba74358d382e3c71489f203aa07aa03ac7bf9fa9
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr --disable-desktopfiles
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
