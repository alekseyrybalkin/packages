#!/bin/sh

#vcs=none
pkgname=ttf-ubuntu
ARCH_NAME=ttf-ubuntu-font-family
pkgver=0.83
urls="https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-${pkgver}.zip"
srczip=fad7939b-ubuntu-font-family-${pkgver}.zip
srcdir=${location}/ubuntu-font-family-${pkgver}

kiin_make() {
    :
}

kiin_install() {
    install -m755 -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 Ubuntu-{L,R,B,C}*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 UbuntuMono-*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

kiin_after_install() {
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    fc-cache -fs > /dev/null
}

kiin_after_upgrade() {
    kiin_after_install
}
