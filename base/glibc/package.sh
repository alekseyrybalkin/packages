#!/bin/sh

pkgname=glibc
pkgver=2.23.1
vcs=git
gittag=0a321a461c726096585c22f735266b31328232ec
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  mkdir -v glibc-build
  cd glibc-build
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms
  echo "slibdir=/usr/lib" >> configparms
  ../configure \
    --prefix=/usr \
    --disable-profile \
    --enable-kernel=3.2 \
    --enable-obsolete-rpc \
    --libexecdir=/usr/lib/glibc \
    --disable-build-nscd \
    --disable-nscd \
    --libdir=/usr/lib
  make
}

kiin_install() {
  cd glibc-build
  make install_root=${pkgdir} install
  rm -rvf ${pkgdir}/var
  rm -rvf ${pkgdir}/lib64
}

kiin_after_install() {
  localedef -i en_US -f UTF-8 en_US.UTF-8
}

kiin_after_upgrade() {
  kiin_after_install
}

known="usr/lib/locale/locale-archive"
