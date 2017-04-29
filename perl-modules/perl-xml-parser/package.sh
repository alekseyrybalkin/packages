#!/bin/sh

pkgname=perl-xml-parser
pkgver=2.44.1
vcs=git
gittag=v2.44_01
urls="http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/XML-Parser-${pkgver}.tar.gz"
srctar=XML-Parser-${pkgver}.tar.gz
relmon_id=3531

kiin_make() {
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
