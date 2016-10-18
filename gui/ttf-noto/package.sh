#!/bin/sh

#vcs=none
pkgname=ttf-noto
SKIP_ARCH_CHECK=1
pkgver=1
extra_urls="https://noto-website.storage.googleapis.com/pkgs/NotoSans-hinted.zip
    https://noto-website.storage.googleapis.com/pkgs/NotoSerif-hinted.zip
    https://noto-website.storage.googleapis.com/pkgs/NotoMono-hinted.zip"
srcdir=${location}/noto-fonts

kiin_make() {
    mkdir ${srcdir}
    cd ${srcdir}
    unzip ${KIIN_HOME}/tarballs/NotoSans-hinted.zip
    rm LICENSE_OFL.txt
    unzip ${KIIN_HOME}/tarballs/NotoSerif-hinted.zip
    rm LICENSE_OFL.txt
    unzip ${KIIN_HOME}/tarballs/NotoMono-hinted.zip
}

kiin_install() {
    cd ${srcdir}
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
