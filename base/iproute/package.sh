#!/bin/sh

pkgname=iproute
ARCH_NAME=iproute2
vcs=git
pkgver=4.12.0
gittag=v${pkgver}
relmon_id=1392

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
