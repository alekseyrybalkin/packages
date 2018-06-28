#!/bin/sh

pkgname=libxcb
pkgver=1.13
vcs=git
git_repo=git://anongit.freedesktop.org/xcb/libxcb
gittag=${pkgname}-${pkgver}
relmon_id=1767

undead_make() {
    sed -e "s/pthread-stubs//" -i configure.ac
    ./autogen.sh $XORG_CONFIG \
        --enable-xinput --enable-xkb \
        --docdir='${datadir}'/doc/${pkgname} \
        --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
