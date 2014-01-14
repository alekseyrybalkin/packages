#!/bin/sh

pkgname=net-tools
pkgver=1.60+
ARCH_VERSION=1.60.20130531git
vcs="git"
gittag=8f124a7073ef43038249484d3ef8dc89af059eb5
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  sed -i "s#/sbin#/bin#" Makefile
  sed -i "s#/usr##" man/Makefile
  yes "" | make || :
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir}/usr update
  rm ${pkgdir}/usr/bin/*name
  rm ${pkgdir}/usr/share/man/man1/hostname.1
  rm ${pkgdir}/usr/share/man/man1/dnsdomainname.1
}
