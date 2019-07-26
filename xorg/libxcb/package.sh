#!/bin/sh

pkgname=libxcb
pkgver=1.13.1
vcs=git
gittag=${pkgver}
relmon_id=1767

build() {
    sed -e "s/pthread-stubs//" -i configure.ac
    ./autogen.sh $XORG_CONFIG \
        --enable-xinput --enable-xkb \
        --docdir='${datadir}'/doc/${pkgname} \
        --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
