#!/bin/sh

#vcs=none
pkgname=procmail
pkgver=3.22
urls="http://www.ring.gr.jp/archives/net/mail/procmail/procmail-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i 's/getline/get_line/' src/*.[ch]
    yes n | make LOCKINGTEST=/tmp
}

kiin_install() {
    make BASENAME=${pkgdir}/usr MANDIR=${pkgdir}/usr/share/man install
}
