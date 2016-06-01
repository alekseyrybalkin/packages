#!/bin/sh

pkgname=libxcb
pkgver=1.12
vcs=git
git_repo=git://anongit.freedesktop.org/xcb/libxcb
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -e "s/pthread-stubs//" -i configure.ac
    patch -Np1 -i ../python-3-fixes.patch
    ./autogen.sh $XORG_CONFIG \
        --enable-xinput --enable-xkb \
        --docdir='${datadir}'/doc/${pkgname} \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
