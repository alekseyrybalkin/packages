#!/bin/sh

pkgname=libxcb
pkgver=1.13.1
vcs=git
git_repo=git://anongit.freedesktop.org/xcb/libxcb
gittag=${pkgver}
relmon_id=1767

kiin_make() {
    sed -e "s/pthread-stubs//" -i configure.ac
    ./autogen.sh $XORG_CONFIG \
        --enable-xinput --enable-xkb \
        --docdir='${datadir}'/doc/${pkgname} \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
