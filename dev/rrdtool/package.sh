#!/bin/sh

pkgname=rrdtool
pkgver=1.4.8
urls="http://oss.oetiker.ch/rrdtool/pub/rrdtool-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -e 's/$(RUBY) extconf.rb/& --vendor/' -i bindings/Makefile.am
  autoreconf
  ./configure --prefix=/usr --localstatedir=/var --disable-rpath \
    --enable-perl --enable-perl-site-install --with-perl-options='INSTALLDIRS=vendor' \
    --enable-ruby --enable-ruby-site-install --enable-python \
    --disable-lua --enable-tcl --disable-libwrap
  make LIBS+="-lglib-2.0"
}

kiin_install() {
  make DESTDIR=${pkgdir} includedir=/usr/include install
  make DESTDIR=${pkgdir} install
}
