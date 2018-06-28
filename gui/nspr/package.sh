#!/bin/sh

pkgname=nspr
pkgver=4.19
vcs=mercurial
hgtag=NSPR_${pkgver//\./_}_RTM
relmon_id=7953

undead_make() {
    sed -ri 's#^(RELEASE_BINS =).*#\1#' pr/src/misc/Makefile.in
    sed -i 's#$(LIBRARY) ##' config/rules.mk
    ./configure --prefix=/usr \
        --with-mozilla \
        --with-pthreads \
        --enable-64bit \
        --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
