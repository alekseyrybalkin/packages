#!/bin/sh

pkgname=rsync
pkgver=3.1.2
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://www.samba.org/ftp/rsync/src/"
check_server=1
relmon_id=4217

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./configure --prefix=/usr --without-included-zlib
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
