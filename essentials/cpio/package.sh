#!/bin/sh

pkgname=cpio
pkgver=2.12
vcs=git
gittag=release_${pkgver//\./_}
urls="http://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=353

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    git clone -s ${KIIN_HOME}/sources/paxutils
    sed -i -e 's/lib\ pax/lib/g' bootstrap.conf
    ./bootstrap --skip-po
    m4 -DMODE=C sysdep.m4 > lib/sysdep.c
    m4 -DMODE=H sysdep.m4 > lib/sysdep.h
    ./configure --prefix=/usr \
        --libexecdir=/tmp \
        --enable-mt \
        --with-rmt=/usr/bin/rmt
    make
    makeinfo --html -o doc/html doc/cpio.texi
    makeinfo --html --no-split -o doc/cpio.html doc/cpio.texi
    makeinfo --plaintext -o doc/cpio.txt doc/cpio.texi
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -v -m755 -d ${pkgdir}/usr/share/doc/cpio-${pkgver}/html
    install -v -m644 doc/html/* \
        ${pkgdir}/usr/share/doc/cpio-${pkgver}/html
    install -v -m644 doc/cpio.{html,txt} \
        ${pkgdir}/usr/share/doc/cpio-${pkgver}
}
