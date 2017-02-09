#!/bin/sh

#vcs=none
pkgname=ttf-noto
SKIP_ARCH_CHECK=1
pkgver=1
extra_urls="https://noto-website.storage.googleapis.com/pkgs/Noto-hinted.zip"
srcdir=${location}/noto-fonts

kiin_make() {
    mkdir ${srcdir}
    cd ${srcdir}
    unzip ${KIIN_HOME}/tarballs/Noto-hinted.zip
}

kiin_install() {
    cd ${srcdir}
    install -m755 -d ${pkgdir}/usr/share/fonts/{TTF,OTF}
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
}

kiin_after_install() {
    mkfontscale /usr/share/fonts/{TTF,OTF}
    mkfontdir /usr/share/fonts/{TTF,OTF}
    fc-cache -fs > /dev/null
}

kiin_after_upgrade() {
    kiin_after_install
}

known="/usr/share/fonts/TTF/fonts.dir \
    /usr/share/fonts/TTF/fonts.scale \
    /usr/share/fonts/OTF/fonts.dir \
    /usr/share/fonts/OTF/fonts.scale"
