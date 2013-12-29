#!/bin/sh

pkgname=ntfsprogs
pkgver=2013.1.13
urls="http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${pkgver}.tgz"
srctar=ntfs-3g_ntfsprogs-${pkgver}.tgz
srcdir=${location}/ntfs-3g_ntfsprogs-${pkgver}

kiin_make() {
  sed -i 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' {ntfsprogs,src}/Makefile.in
  ./configure --prefix=/usr \
    --with-fuse=external \
    --disable-static \
    --sbin=/usr/bin \
    --disable-ldconfig
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} rootbindir=/usr/bin rootsbindir=/usr/bin install
  ln -sv ntfs-3g ${pkgdir}/usr/bin/mount.ntfs
  ln -sv /usr/share/man/man8/ntfs-3g.8 ${pkgdir}/usr/share/man/man8/mount.ntfs.8
}
