#!/bin/sh

pkgname=compton
pkgver=0.1_beta2.5
vcs=git
gittag=2343e4bbd298b35ea5c190c52abd2b0cb9f79a18
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    NO_LIBCONFIG=1 NO_DBUS=1 COMPTON_VERSION=v${pkgver} make PREFIX=/usr compton docs
}

kiin_install() {
    NO_LIBCONFIG=1 NO_DBUS=1 make PREFIX=${pkgdir}/usr install
    install -Dm644 compton.sample.conf ${pkgdir}/etc/xdg/compton.conf.example
}
