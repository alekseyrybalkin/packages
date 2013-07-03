#!/bin/sh

pkgname=subversion
pkgver=1.8.0
extension=bz2
folder="http://archive.apache.org/dist/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  MAKEFLAGS=
  ./configure --prefix=/usr --with-apr=/usr --with-apr-util=/usr \
    --with-zlib=/usr --with-serf=/usr --with-neon=/usr \
    --with-sqlite=/usr --disable-static
  make LT_LDFLAGS="-L$Fdestdir/usr/lib" local-all
  make swig-py swig-pl
}

kiin_install() {
  MAKEFLAGS=
  export LD_LIBRARY_PATH=${pkgdir}/usr/lib:${LD_LIBRARY_PATH}
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/subversion-${pkgver}
  cp -v -R doc/* ${pkgdir}/usr/share/doc/subversion-${pkgver}
  make DESTDIR=${pkgdir} install-swig-pl
  make DESTDIR=${pkgdir} install-swig-py
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
