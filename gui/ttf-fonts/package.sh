#!/bin/sh

pkgname=ttf-fonts
SKIP_ARCH_CHECK=1
pkgver=1
vcs=git

kiin_make() {
    :
}

kiin_install() {
    install -m755 -d ${pkgdir}/usr/share/fonts/TTF
    for dir in `find . -mindepth 1 -maxdepth 1 -type d -name "ttf-*"`; do
        install -m644 ${dir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    done
}

kiin_after_install() {
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    fc-cache -fs > /dev/null
}

kiin_after_upgrade() {
    kiin_after_install
}
