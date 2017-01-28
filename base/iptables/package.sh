#!/bin/sh

pkgname=iptables
pkgver=1.6.1
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --with-xtlibdir=/usr/lib/xtables \
        --disable-nftables \
        --enable-libipq
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    ln -sfv xtables-multi ${pkgdir}/usr/bin/iptables-xml
}
