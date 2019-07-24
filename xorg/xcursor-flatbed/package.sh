#!/bin/sh

pkgname=xcursor-flatbed
pkgver=0.5
vcs=git
vcs_pkgname=flatbedcursors
gittag=${pkgver}

kiin_make() {
    :
}

kiin_install() {
    export ICONSDIR=${pkgdir}/usr/share/icons/
    mkdir -p ${pkgdir}/usr/share/icons/
    ./install-all
}
