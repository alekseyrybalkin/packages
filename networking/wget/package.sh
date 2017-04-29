#!/bin/sh

pkgname=wget
pkgver=1.19.1
vcs=git
# FIXME
#gittag=v${pkgver}
gittag=f31b93424befc27f3f056ac4347546a2b17eceb9
relmon_id=5124

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --with-ssl=openssl
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    echo "ca-directory=/etc/ssl/certs" >> ${pkgdir}/etc/wgetrc
}
