#!/bin/sh

pkgname=libaio
pkgver=0.3.112
vcs=git
#FIXME
gittag=8a71c9c7bdccb9dd5772d98e83c8c35a7771bb00
urls="http://ftp.de.debian.org/debian/pool/main/liba/libaio/libaio_${pkgver}.orig.tar.xz"
relmon_id=1557

kiin_make() {
    sed -i '/install.*libaio.a/s/^/#/' src/Makefile
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
