#!/bin/sh

pkgname=mercurial
pkgver=3.2.2
extension=gz
folder="http://mercurial.selenic.com/release/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  make build
}

kiin_install() {
  make PREFIX=${pkgdir}/usr install-bin
}
