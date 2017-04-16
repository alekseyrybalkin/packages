#!/bin/sh

pkgname=inetutils
pkgver=1.9.4
vcs=git
gittag=inetutils-${pkgver//\./_}
relmon_id=13805

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --libexecdir=/usr/bin \
        --localstatedir=/var \
        --disable-ifconfig \
        --disable-logger \
        --disable-syslogd \
        --disable-whois \
        --disable-servers
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
