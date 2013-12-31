#!/bin/sh

pkgname=subversion
pkgver=1.8.5
extension=bz2
folder="http://archive.apache.org/dist/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  MAKEFLAGS=
  ./configure --prefix=/usr --with-apr=/usr --with-apr-util=/usr \
    --with-zlib=/usr --with-serf=/usr --with-neon=/usr \
    --with-sqlite=/usr --disable-static
  make LT_LDFLAGS="-L$Fdestdir/usr/lib" local-all
  make swig-pl
  make swig-py swig_pydir=/usr/lib/python2.7/site-packages/libsvn \
    swig_pydir_extra=/usr/lib/python2.7/site-packages/svn
}

kiin_install() {
  MAKEFLAGS=
  export LD_LIBRARY_PATH=${pkgdir}/usr/lib:${LD_LIBRARY_PATH}
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/subversion-${pkgver}
  cp -v -R doc/* ${pkgdir}/usr/share/doc/subversion-${pkgver}
  make DESTDIR=${pkgdir} install-swig-pl
  make DESTDIR=${pkgdir} install-swig-py swig_pydir=/usr/lib/python2.7/site-packages/libsvn \
    swig_pydir_extra=/usr/lib/python2.7/site-packages/svn
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
