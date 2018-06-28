#!/bin/sh

#vcs=none
pkgname=perl-error
pkgver=0.17025
urls="http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Error-${pkgver}.tar.gz"
srctar=Error-${pkgver}.tar.gz
srcdir=${location}/Error-${pkgver}
relmon_id=7092

undead_make() {
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
