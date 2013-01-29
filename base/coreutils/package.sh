#!/bin/sh

pkgname=coreutils
pkgver=8.20
urls="http://ftp.gnu.org/gnu/coreutils/coreutils-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-no-install-program=kill,uptime
  make
}

kiin_install() {
  mkdir ${pkgdir}/bin
  mkdir -p ${pkgdir}/usr/sbin
  mkdir -p ${pkgdir}/usr/share/man/man8
  make DESTDIR=${pkgdir} install
  mv -v ${pkgdir}/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/{rmdir,stty,sync,true,uname,test,[} ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/chroot ${pkgdir}/usr/sbin
  mv -v ${pkgdir}/usr/share/man/man1/chroot.1 ${pkgdir}/usr/share/man/man8/chroot.8
  sed -i s/\"1\"/\"8\"/1 ${pkgdir}/usr/share/man/man8/chroot.8
  mv -v ${pkgdir}/usr/bin/{head,sleep,nice} ${pkgdir}/bin
}
