#!/bin/sh

pkgname=git
pkgver=2.8.4
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

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
