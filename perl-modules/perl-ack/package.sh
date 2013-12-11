#!/bin/sh

pkgname=perl-ack
pkgver=2.12
urls="http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/ack-${pkgver}.tar.gz"
srctar=ack-${pkgver}.tar.gz
srcdir=${location}/ack-${pkgver}

kiin_make() {
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
