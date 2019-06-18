#!/bin/sh

pkgname=pam
pkgver=1.3.1
vcs=git
gittag=v${pkgver}
relmon_id=12244

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libdir=/usr/lib \
        --enable-securedir=/lib/security \
        --docdir=/usr/share/doc/pam \
        --disable-regenerate-docu
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
