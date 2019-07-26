pkgname=perl-file-next
pkgver=1.16
vcs=git
gittag=${pkgver}
relmon_id=2895

build() {
    PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
        PERL_AUTOINSTALL=--skipdeps \
        PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=${pkgdir}" \
        PERL_MB_OPT="--installdirs vendor --destdir ${pkgdir}" \
        MODULEBUILDRC=/dev/null \
        perl Makefile.PL
    make
}

package() {
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
