#!/bin/sh

pkgname=logrotate
pkgver=3.12.3
vcs=git
gittag=${pkgver}
urls="http://fedorahosted.org/releases/l/o/logrotate/logrotate-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=10567

kiin_make() {
    export CFLAGS="${CFLAGS} -Wno-misleading-indentation"
    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
