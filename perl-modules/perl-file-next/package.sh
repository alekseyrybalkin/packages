#!/bin/sh

pkgname=perl-file-next
pkgver=1.12
vcs=git
gittag=${pkgver}
urls="http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/File-Next-${pkgver}.tar.gz"
srctar=File-Next-${pkgver}.tar.gz
srcdir=${location}/File-Next-${pkgver}

kiin_make() {
  PERL_MM_USE_DEFAULT=1 PERL5LIB=""                        \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=${pkgdir}"     \
    PERL_MB_OPT="--installdirs vendor --destdir ${pkgdir}" \
    MODULEBUILDRC=/dev/null                                \
    perl Makefile.PL
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
  #sed -i -e 's/\/sources\/perl-modules\/perl-file-next\/kiin-dest//g' \
  #  ${pkgdir}/usr/lib/perl5/vendor_perl/5.16.1/x86_64-linux/auto/File/Next/.packlist
}
