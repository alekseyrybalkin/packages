#!/bin/sh

#vcs=none
pkgname=perl-error
pkgver=0.17024
urls="http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Error-${pkgver}.tar.gz"
srctar=Error-${pkgver}.tar.gz
srcdir=${location}/Error-${pkgver}

kiin_make() {
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
  #sed -i -e 's/\/sources\/perl-modules\/perl-error\/kiin-dest//g' \
  #  ${pkgdir}/usr/lib/perl5/vendor_perl/5.16.1/x86_64-linux/auto/Error/.packlist
}
