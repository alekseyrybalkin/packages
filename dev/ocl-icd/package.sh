#!/bin/sh

pkgname=ocl-icd
pkgver=2.2.11
vcs=git
# FIXME
gittag=b2e12efda1fb2f03c653b5e1c6e5f0414f47ba38
relmon_id=2525

kiin_make() {
    ./bootstrap
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
