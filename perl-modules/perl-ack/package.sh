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
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
  #sed -i -e 's/\/sources\/perl-modules\/perl-ack\/kiin-dest//g' \
  #  ${pkgdir}/usr/lib/perl5/vendor_perl/5.16.1/x86_64-linux/auto/ack/.packlist
}
