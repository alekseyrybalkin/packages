#!/bin/sh

pkgname=gn
pkgver=0.1568+
vcs=git
#FIXME
gittag=c599fdbbcdb7eb6c7e345e36e1ae5de16a91509f

kiin_make() {
    ./build/gen.py
    ninja -C out gn
}

kiin_install() {
    install -D out/gn ${pkgdir}/usr/bin/gn
}
