#!/bin/sh

pkgname=ldns
pkgver=1.6.17
vcs=git
gittag=release-${pkgver}
urls="http://www.nlnetlabs.nl/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/defined(@$also)/@$also/' doc/doxyparse.pl
  git clone ${SOURCES_HOME}/dns-ldns contrib/DNS-LDNS
  libtoolize -c --install || libtoolize -c || error_cleanup "Libtoolize failed."
  autoreconf
  cd examples && autoreconf && cd ..
  cd drill && autoreconf && cd ..
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-static=no \
    --disable-rpath \
    --with-drill \
    --with-examples
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
