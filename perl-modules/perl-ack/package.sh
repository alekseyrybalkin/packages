#!/bin/sh

pkgname=perl-ack
pkgver=1.96
urls="http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/ack-${pkgver}.tar.gz"
srctar=ack-${pkgver}.tar.gz
srcdir=${location}/ack-${pkgver}

kiin_make() {
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
