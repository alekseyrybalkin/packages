#!/bin/sh

pkgname=perl-error
pkgver=0.17018
urls="http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Error-${pkgver}.tar.gz"
srctar=Error-${pkgver}.tar.gz
srcdir=${location}/Error-${pkgver}

kiin_make() {
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
