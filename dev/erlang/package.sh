#!/bin/sh

pkgname=erlang
pkgver=19.1.6
vcs=git
vcs_pkgname=otp
gittag=OTP-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./otp_build setup
    ./configure --prefix=/usr --enable-smp-support --without-odbc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
