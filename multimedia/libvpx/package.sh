#!/bin/sh

pkgname=libvpx
pkgver=1.6.1
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-v${pkgver}

kiin_make() {
    sed -i 's/cp -p/cp/' build/make/Makefile
    chmod -v 644 vpx/*.h
    mkdir libvpx-build
    cd libvpx-build
    if [ -z "${KIIN_LIB32}" ]; then
        ../configure --prefix=/usr \
            --enable-shared \
            --disable-static \
            --libdir=${LIBDIR}
    else
        ../configure --prefix=/usr \
            --enable-shared \
            --disable-static \
            --target=x86-linux-gcc \
            --libdir=${LIBDIR}
    fi
    make
}

kiin_install() {
    cd libvpx-build
    make DESTDIR=${pkgdir} install
}
