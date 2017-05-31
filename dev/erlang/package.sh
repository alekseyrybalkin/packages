#!/bin/sh

pkgname=erlang
pkgver=20.0rc
vcs=git
vcs_pkgname=otp
#FIXME
gittag=OTP-20.0-rc1
#gittag=OTP-${pkgver}
# minor versions
#relmon_id=707

kiin_make() {
    ./otp_build autoconf
    ./configure --prefix=/usr --enable-smp-support --without-odbc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
