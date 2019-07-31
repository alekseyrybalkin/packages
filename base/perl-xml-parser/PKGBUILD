pkgname=perl-xml-parser
_ver=2.44
_minor=1
pkgver=${_ver}.${_minor}
vcs=git
gittag=v${_ver}_0${_minor}
relmon_id=3531

build() {
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
