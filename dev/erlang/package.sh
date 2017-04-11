#!/bin/sh

pkgname=erlang
pkgver=19.3
vcs=git
vcs_pkgname=otp
gittag=OTP-${pkgver}
relmon_id=707

kiin_make() {
    ./otp_build setup
    ./configure --prefix=/usr --enable-smp-support --without-odbc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
