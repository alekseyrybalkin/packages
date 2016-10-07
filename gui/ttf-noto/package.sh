#!/bin/sh

#vcs=none
pkgname=ttf-noto
SKIP_ARCH_CHECK=1
pkgver=1
urls="http://rybalkin.org/static/noto-fonts.tar.xz"
srctar=noto-fonts.tar.xz
srcdir=${location}/noto-fonts

kiin_make() {
    :
}

kiin_install() {
    install -m755 -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
}

kiin_after_install() {
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    fc-cache -fs > /dev/null
}

kiin_after_upgrade() {
    kiin_after_install
}

known="/usr/share/fonts/TTF/fonts.dir /usr/share/fonts/TTF/fonts.scale"
