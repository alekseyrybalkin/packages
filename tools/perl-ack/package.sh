#!/bin/sh

pkgname=perl-ack
ARCH_NAME=ack
pkgver=3.0.0
vcs=git
gittag=v${pkgver}
relmon_id=15

kiin_make() {
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
