#!/bin/sh

pkgname=pam
pkgver=1.3.1
vcs=git
gittag=v${pkgver}
relmon_id=12244

kiin_make() {
    patch -Np1 -i ../remove_browser_dep.patch

    ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libdir=/usr/lib \
        --sbindir=/usr/bin \
        --disable-db \
        --docdir=/usr/share/doc/pam
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
