#!/bin/sh

pkgname=libxml2
vcs=git

pkgver=2.9.4
ARCH_VERSION=2.9.4+16+g07418011
gittag=v${pkgver}

extension=gz
folder="http://xmlsoft.org/sources/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
    ./autogen.sh --prefix=/usr --disable-static --with-history --with-python=/usr/bin/python2 --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
