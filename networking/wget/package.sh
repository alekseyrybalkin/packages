#!/bin/sh

pkgname=wget
pkgver=1.19.4
vcs=git
gittag=v${pkgver}
relmon_id=5124

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --build=x86_64-unknown-linux-gnu \
        --with-ssl=openssl
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    echo "ca-directory=/etc/ssl/certs" >> ${pkgdir}/etc/wgetrc
}
