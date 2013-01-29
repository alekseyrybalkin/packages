#!/bin/sh

pkgname=ntfsprogs
pkgver=2013.1.13
urls="http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${pkgver}.tgz"
srctar=ntfs-3g_ntfsprogs-${pkgver}.tgz
srcdir=${location}/ntfs-3g_ntfsprogs-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --with-fuse=external \
    --disable-static \
    --disable-ldconfig
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sv /bin/ntfs-3g ${pkgdir}/sbin/mount.ntfs
  ln -sv /usr/share/man/man8/ntfs-3g.8 ${pkgdir}/usr/share/man/man8/mount.ntfs.8
}
