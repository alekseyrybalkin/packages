#!/bin/sh

pkgname=kiin
vcs="git"
gittag=v1.0.0
pkgver=1.0.0
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  true
}

kiin_install() {
  mkdir -p ${pkgdir}/{etc,usr/bin}
  cp kiin kiin-db-manager.py ${pkgdir}/usr/bin
  cp kiin.conf.bash ${pkgdir}/etc
}
