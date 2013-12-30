#!/bin/sh

pkgname=kiin
vcs="git"
gittag=v1.0.0
pkgver=1.0.0
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  gcc -o _kiin-rename kiin-rename.c
}

kiin_install() {
  mkdir ${pkgdir}/usr/bin
  cp kiin ${pkgdir}/usr/bin/kiin
  cp _kiin-rename ${pkgdir}/usr/bin/_kiin-rename
  cp db_manager.py ${pkgdir}/usr/bin/_kiin-db-manager.py
  cp fix_symlinks.py ${pkgdir}/usr/bin/_kiin-fix-symlinks.py
}
