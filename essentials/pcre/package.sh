#!/bin/sh

pkgname=pcre
pkgver=8.34
extension=bz2
folder="ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
              --docdir=/usr/share/doc/pcre \
              --enable-unicode-properties \
              --enable-pcre16 \
              --enable-pcre32 \
              --enable-pcregrep-libz \
              --enable-pcregrep-libbz2 \
              --disable-static \
              --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    mkdir -pv ${pkgdir}/lib
    mv -v ${pkgdir}/usr/lib/libpcre.so.* ${pkgdir}/lib
    ln -sfv ../../lib/libpcre.so.1.2.2 ${pkgdir}/usr/lib/libpcre.so
  fi
}
