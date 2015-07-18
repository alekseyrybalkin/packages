#!/bin/sh

pkgname=sysklogd
SKIP_ARCH_CHECK=1
pkgver=1.5.1
vcs=git
git_repo=git://git.infodrom.org/infodrom/sysklogd
gittag=9abddd6b552a341b9b7c63c8bddfc95863821abd
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/{usr/bin,usr/sbin}
  mkdir -pv ${pkgdir}/usr/share/man/man5
  mkdir -pv ${pkgdir}/usr/share/man/man8
  make prefix=${pkgdir} install
  mv -v ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin
  rmdir ${pkgdir}/usr/sbin
}
