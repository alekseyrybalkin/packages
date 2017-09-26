#!/bin/sh

pkgname=git
pkgver=2.14.2
vcs=git
gittag=v${pkgver}
relmon_id=5350

kiin_make() {
    make configure
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib \
        --with-libpcre \
        --with-gitconfig=/etc/gitconfig
    make
    make html
    make man
}

kiin_install() {
    make DESTDIR=${pkgdir} install install-html install-man
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
