#!/bin/sh

pkgname=libgpg-error
pkgver=1.36
vcs=git
gittag=libgpg-error-${pkgver}
relmon_id=1628

kiin_make() {
    ./autogen.sh
    sed -i 's/namespace/pkg_&/' src/Makefile.{am,in} src/mkstrtable.awk
    ./configure --enable-maintainer-mode \
        --prefix=/usr \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
