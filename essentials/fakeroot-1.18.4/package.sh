#!/bin/sh

pkgname=fakeroot
pkgver=1.18.4
srctar=${pkgname}_${pkgver}.orig.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=/usr/lib/libfakeroot \
              --disable-static --with-ipc=sysv
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -dm755 ${pkgdir}/etc/ld.so.conf.d/
  echo '/usr/lib/libfakeroot' > ${pkgdir}/etc/ld.so.conf.d/fakeroot.conf
  install -Dm644 README $pkgdir/usr/share/doc/fakeroot/README
}
