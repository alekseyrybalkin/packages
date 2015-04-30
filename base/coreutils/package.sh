#!/bin/sh

pkgname=coreutils
pkgver=8.23
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git cherry-pick 8878c4ef1b88fd07a48ccd7df6bff7ba0929dad7
  git clone ${KIIN_HOME}/sources/gnulib
  ./bootstrap --skip-po
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-no-install-program=kill,uptime
  make
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/share/man/man8
  make DESTDIR=${pkgdir} install
  mv -v ${pkgdir}/usr/share/man/man1/chroot.1 ${pkgdir}/usr/share/man/man8/chroot.8
  sed -i s/\"1\"/\"8\"/1 ${pkgdir}/usr/share/man/man8/chroot.8
}
