#!/bin/sh

pkgname=perl-archive-zip
pkgver=1.34
urls="http://search.cpan.org/CPAN/authors/id/P/PH/PHRED/Archive-Zip-${pkgver}.tar.gz"
srctar=Archive-Zip-${pkgver}.tar.gz
srcdir=${location}/Archive-Zip-${pkgver}

kiin_make() {
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
