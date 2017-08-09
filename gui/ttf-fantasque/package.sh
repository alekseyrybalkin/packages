#!/bin/sh

#vcs=none
pkgname=ttf-fantasque
SKIP_ARCH_CHECK=1
pkgver=1
urls="http://webfonts.ru/original/fantasquesansmono/fantasquesansmono.zip"
_srczip=fantasquesansmono.zip
_srcdir=${location}/fantasquesansmono

kiin_make() {
    mkdir ${_srcdir}
    unzip ${KIIN_HOME}/tarballs/${_srczip} -d ${_srcdir}
}

kiin_install() {
    cd ${_srcdir}
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
