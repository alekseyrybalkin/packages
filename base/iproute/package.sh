#!/bin/sh

pkgname=iproute
ARCH_NAME=iproute2
vcs=git
pkgver=4.9.0
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i /ARPD/d Makefile
    sed -i 's/arpd.8//' man/man8/Makefile
    ./configure --prefix=/usr
    sed -i -e '/HAVE_BERKELEY_DB:=y/d' Config
    make DESTDIR=
}

kiin_install() {
    make DESTDIR=${pkgdir} \
        MANDIR=/usr/share/man \
        DOCDIR=/usr/share/doc/${pkgname} install
    mv ${pkgdir}/{sbin,usr/bin}
}
