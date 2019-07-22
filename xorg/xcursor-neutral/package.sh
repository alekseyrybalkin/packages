#!/bin/sh

#vcs=none
pkgname=xcursor-neutral
pkgver=1.13a
urls="https://distribute.kde.org/khotnewstuff/mousethemes/downloads/28310-neutral-${pkgver}.tar.gz"
srctar=28310-neutral-${pkgver}.tar.gz
srcdir=${location}/neutral

kiin_make() {
    :
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/share/icons/Neutral
    sed s/neutral/Neutral/ -i index.theme
    cp -r {cursors,index.theme} ${pkgdir}/usr/share/icons/Neutral/
}
