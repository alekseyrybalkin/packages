#!/bin/sh

pkgname=coreutils
pkgver=8.19
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # fixes bug in test case, FYI:
  sed -i -e 's/! isatty/isatty/' \
        -e '45i\              || errno == ENOENT' gnulib-tests/test-getlogin.c
  patch -Np1 -i ../coreutils-8.19-i18n-1.patch
  FORCE_UNSAFE_CONFIGURE=1 ./configure \
              --prefix=/usr         \
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
  mv -v ${pkgdir}/usr/bin/{rmdir,stty,sync,true,uname} ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/chroot ${pkgdir}/usr/sbin
  mv -v ${pkgdir}/usr/share/man/man1/chroot.1 ${pkgdir}/usr/share/man/man8/chroot.8
  sed -i s/\"1\"/\"8\"/1 ${pkgdir}/usr/share/man/man8/chroot.8
  mv -v ${pkgdir}/usr/bin/{head,sleep,nice} ${pkgdir}/bin
}
