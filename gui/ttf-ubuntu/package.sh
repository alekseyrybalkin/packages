#!/bin/sh

#vcs=none
pkgname=ttf-ubuntu
ARCH_NAME=ttf-ubuntu-font-family
pkgver=0.83
urls="http://font.ubuntu.com/download/ubuntu-font-family-${pkgver}.zip"
srczip=ubuntu-font-family-${pkgver}.zip
srcdir=${location}/ubuntu-font-family-${pkgver}

undead_make() {
    :
}

undead_install() {
    install -m755 -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 Ubuntu-{L,R,B,C}*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 UbuntuMono-*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

undead_after_install() {
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    fc-cache -fs > /dev/null
}

undead_after_upgrade() {
    undead_after_install
}
