#!/bin/sh

pkgname=rsync
pkgver=3.1.3
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://www.samba.org/ftp/rsync/src/"
check_server=1
relmon_id=4217

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./configure --prefix=/usr --without-included-zlib
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
