#!/bin/sh

pkgname=net-tools
pkgver=1.60+
vcs="git"
gittag=8f124a7073ef43038249484d3ef8dc89af059eb5
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  yes "" | make || :
}

kiin_install() {
  make DESTDIR=${pkgdir}/usr update
  rm ${pkgdir}/usr/bin/*name
}
