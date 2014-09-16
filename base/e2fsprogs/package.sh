#!/bin/sh

pkgname=e2fsprogs
pkgver=1.42.12
urls=" http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  mkdir -v build
  cd build
  ../configure --prefix=/usr \
    --with-root-prefix="" \
    --enable-elf-shlibs \
    --disable-libblkid \
    --disable-libuuid \
    --disable-uuidd \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --disable-fsck
  make
}

kiin_install() {
  MAKEFLAGS=
  cd build
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install-libs
  chmod -v u+w ${pkgdir}/usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
  gunzip -v ${pkgdir}/usr/share/info/libext2fs.info.gz
  makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
  install -v -m644 doc/com_err.info ${pkgdir}/usr/share/info
}
