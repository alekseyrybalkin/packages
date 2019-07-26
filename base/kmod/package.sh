#!/bin/sh

pkgname=kmod
pkgver=26
vcs=git
gittag=v${pkgver}
relmon_id=1517

build() {
    touch libkmod/docs/gtk-doc.make
    autoreconf -f -i
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --with-xz \
        --with-zlib
    make
}

package() {
    make DESTDIR=${pkgdir} pkgconfigdir=/usr/lib/pkgconfig install
    for target in depmod insmod modinfo modprobe rmmod; do
        ln -sv kmod ${pkgdir}/usr/bin/${target}
    done
    ln -sv kmod ${pkgdir}/usr/bin/lsmod
}
