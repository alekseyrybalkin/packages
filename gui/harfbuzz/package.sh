#!/bin/sh

pkgname=harfbuzz
pkgver=1.7.6
vcs=git
gittag=${pkgver}
extension=bz2
folder="http://www.freedesktop.org/software/${pkgname}/release/"
check_server=1
relmon_id=1299

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh --prefix=/usr --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
