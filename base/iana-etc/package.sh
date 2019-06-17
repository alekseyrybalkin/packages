#!/bin/sh

#vcs=none
pkgname=iana-etc
pkgver=20190531

kiin_make() {
    :
}

kiin_install() {
    install -Dm644 ../protocols ${pkgdir}/etc/protocols
    install -Dm644 ../services ${pkgdir}/etc/services
}
