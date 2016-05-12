#!/bin/sh

pkgname=kbd
pkgver=2.0.3
vcs=git
gittag=baeb5aa827d956bd06492775dc5bd9f89d394149
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
    ./configure --prefix=/usr \
        --disable-vlock \
        --disable-tests
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
