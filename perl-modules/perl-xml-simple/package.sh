#!/bin/sh

pkgname=perl-xml-simple
pkgver=2.24
# building from git requires perl-dist-zilla which requires perl-app-cmd and maybe more
#vcs=git
#gittag=v${pkgver}
urls="http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-Simple-${pkgver}.tar.gz"
srctar=XML-Simple-${pkgver}.tar.gz
srcdir=${location}/XML-Simple-${pkgver}

kiin_make() {
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
