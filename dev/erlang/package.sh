#!/bin/sh

pkgname=erlang
pkgver=19.3
vcs=git
vcs_pkgname=otp
gittag=OTP-${pkgver}
# minor versions
#relmon_id=707

kiin_make() {
    git cherry-pick -n 25aa0128340d819e85e641f0ef8b9e0fd5fdda0b
    git cherry-pick -n e30294f44d02200c20a80f1a3a2bb075afc3747d
    git cherry-pick -n 78a5de9611c25a4e7b5248aa9828f949f3a5c131
    git cherry-pick -n 1cdaf0a6fd8dbbf08fe88dd148424df4da683f48
    patch -Np1 -i ../disable-deprecated.patch
    patch -Np1 -i ../openssl-1.1.0.patch
    ./otp_build setup
    ./configure --prefix=/usr --enable-smp-support --without-odbc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
