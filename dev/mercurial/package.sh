#!/bin/sh

pkgname=mercurial
pkgver=2.7.2
extension=gz
folder="http://mercurial.selenic.com/release/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  make build
}

kiin_install() {
  make PREFIX=${pkgdir}/usr install-bin
}
