#!/bin/sh

pkgname=device-mapper
ARCH_NAME=lvm2
pkgver=2.02.119
vcs=git
git_pkgname=lvm2
gittag=v${pkgver//\./_}
srcdir=${location}/LVM2.${pkgver}

kiin_make() {
  unset LDFLAGS
  autoreconf -fi
  ./configure --prefix=/ --sbindir=/usr/bin --sysconfdir=/etc \
    --localstatedir=/var --datarootdir=/usr/share \
    --includedir=/usr/include --with-usrlibdir=/usr/lib \
    --libdir=/usr/lib --enable-pkgconfig --enable-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install_device-mapper
}
