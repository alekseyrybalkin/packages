pkgname=git
pkgver=2.22.0
vcs=git
gittag=v${pkgver}
relmon_id=5350

build() {
    make configure
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib \
        --with-libpcre \
        --with-gitconfig=/etc/gitconfig
    make
    make html
    make man
}

package() {
    make DESTDIR=${pkgdir} install install-html install-man
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}