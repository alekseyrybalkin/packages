#!/bin/sh

pkgname=winetricks
pkgver=2013
urls="http://winetricks.googlecode.com/svn-history/trunk/src/winetricks \
  http://winetricks.googlecode.com/svn-history/trunk/src/winetricks.1"

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 winetricks ${pkgdir}/usr/bin/winetricks
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 winetricks.1 ${pkgdir}/usr/share/man/man1/winetricks.1
}
