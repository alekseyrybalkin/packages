#!/bin/sh

pkgname=nspr
pkgver=4.13.1
vcs=mercurial
hgtag=NSPR_${pkgver//\./_}_RTM
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -ri 's#^(RELEASE_BINS =).*#\1#' pr/src/misc/Makefile.in
    sed -i 's#$(LIBRARY) ##' config/rules.mk
    ./configure --prefix=/usr \
        --with-mozilla \
        --with-pthreads \
        $([ -z "$KIIN_LIB32" ] && echo --enable-64bit) \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
