#!/bin/sh

pkgname=chromium-themes
SKIP_ARCH_CHECK=1
pkgver=1

kiin_make() {
    :
}

kiin_install() {
    for theme in russia iceland world; do
        mkdir -p ${pkgdir}/usr/lib/chromium/themes/${theme}
        cp ../${theme}-theme.json ${pkgdir}/usr/lib/chromium/themes/${theme}/manifest.json
        chmod 644 ${pkgdir}/usr/lib/chromium/themes/${theme}/manifest.json
    done
}
