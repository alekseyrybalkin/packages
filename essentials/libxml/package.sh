#!/bin/sh

pkgname=libxml
ARCH_NAME=libxml2
pkgver=2.9.9
vcs=git
vcs_pkgname=libxml2
gittag=v${pkgver}
relmon_id=1783

kiin_make() {
    sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
    ./autogen.sh --prefix=/usr --disable-static --with-history --with-python=/usr/bin/python2 --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
