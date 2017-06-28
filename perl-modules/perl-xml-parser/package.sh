#!/bin/sh

pkgname=perl-xml-parser
_ver=2.44
_minor=1
pkgver=${_ver}.${_minor}
vcs=git
gittag=v${_ver}_0${_minor}
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
