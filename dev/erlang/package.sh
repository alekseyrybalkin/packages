#!/bin/sh

pkgname=erlang
pkgver=20.0.2
vcs=git
vcs_pkgname=otp
gittag=OTP-${pkgver}
relmon_id=707

kiin_make() {
    ./otp_build autoconf
    ./configure --prefix=/usr --enable-smp-support --without-odbc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
