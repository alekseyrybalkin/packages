#!/bin/sh

pkgname=kmod
pkgver=22
vcs=git
gittag=v${pkgver}
urls="http://www.kernel.org/pub/linux/utils/kernel/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    touch libkmod/docs/gtk-doc.make
    autoreconf -f -i
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --with-xz \
        --with-zlib
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} pkgconfigdir=/usr/lib/pkgconfig install
    for target in depmod insmod modinfo modprobe rmmod; do
        ln -sv kmod ${pkgdir}/usr/bin/${target}
    done
    ln -sv kmod ${pkgdir}/usr/bin/lsmod
}
