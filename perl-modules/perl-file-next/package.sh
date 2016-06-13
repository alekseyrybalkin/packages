#!/bin/sh

pkgname=perl-file-next
pkgver=1.14
vcs=git
gittag=${pkgver}
urls="http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/File-Next-${pkgver}.tar.gz"
srctar=File-Next-${pkgver}.tar.gz
srcdir=${location}/File-Next-${pkgver}

kiin_make() {
    PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
        PERL_AUTOINSTALL=--skipdeps \
        PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=${pkgdir}" \
        PERL_MB_OPT="--installdirs vendor --destdir ${pkgdir}" \
        MODULEBUILDRC=/dev/null \
        perl Makefile.PL
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
