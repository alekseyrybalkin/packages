#!/bin/sh

pkgname=git
pkgver=2.0.1
urls="https://www.kernel.org/pub/software/scm/git/${pkgname}-${pkgver}.tar.xz \
  https://www.kernel.org/pub/software/scm/git/${pkgname}-manpages-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr         \
              --libexecdir=/usr/lib \
              --with-libpcre \
              --with-gitconfig=/etc/gitconfig
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  tar -xf ${KIIN_HOME}/tarballs/${pkgname}-manpages-${pkgver}.tar.xz -C ${pkgdir}/usr/share/man \
    --no-same-owner --no-overwrite-dir
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
