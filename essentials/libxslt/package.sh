#!/bin/sh

pkgname=libxslt
pkgver=1.1.32
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://xmlsoft.org/sources/"
check_server=1
relmon_id=13301

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
    ./autogen.sh --prefix=/usr --disable-static --libdir=${LIBDIR} --with-python=/usr/bin/python2
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm -f "${pkgdir}"/usr/lib/python*/site-packages/*.a
}
