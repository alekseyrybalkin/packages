#!/bin/sh

pkgname=subversion
pkgver=1.7.9
urls="http://archive.apache.org/dist/${pkgname}/${pkgname}-${pkgver}.tar.bz2 \
  http://rybalkin.org/kiin-files/subversion.rpath.fix.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -p0 -i ../subversion.rpath.fix.patch
  ./configure --prefix=/usr --with-apr=/usr --with-apr-util=/usr \
    --with-zlib=/usr --with-neon=/usr --with-sqlite=/usr
  make external-all
  make LT_LDFLAGS="-L$Fdestdir/usr/lib" local-all
  make swig-py swig-pl
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/subversion-${pkgver}
  cp -v -R doc/* ${pkgdir}/usr/share/doc/subversion-${pkgver}
  make DESTDIR=${pkgdir} install-swig-pl
  make DESTDIR=${pkgdir} install-swig-py
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
  #sed -i -e 's/\/sources\/essentials\/subversion\/kiin-dest//g' \
  #  ${pkgdir}/usr/lib/perl5/site_perl/5.16.1/x86_64-linux/auto/SVN/_Core/.packlist
}
