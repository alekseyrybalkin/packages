#!/bin/sh

pkgname=inetutils
pkgver=1.9.4
vcs=git
gittag=inetutils-${pkgver//\./_}
relmon_id=13805

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --libexecdir=/usr/bin \
        --localstatedir=/var \
        --disable-ifconfig \
        --disable-logger \
        --disable-syslogd \
        --disable-whois \
        --disable-servers \
        --build=x86_64-unknown-linux-gnu
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
