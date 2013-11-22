#!/bin/sh

pkgname=fontconfig
pkgver=2.11.0
urls="http://${pkgname}.org/release/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --docdir=/usr/share/doc/${pkgname}-${pkgver} \
    --disable-docs \
    --disable-static \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/share/fonts \
    --with-templatedir=/etc/fonts/conf.avail \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
