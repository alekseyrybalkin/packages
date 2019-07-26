#!/bin/sh

pkgname=addons
SKIP_ARCH_CHECK=1
pkgver=1
vcs=git

build() {
    ./bootstrap
}

package() {
    cp -av etc usr ${pkgdir}/

    chown root:${PACMAN} ${pkgdir}/usr/bin/*
    chmod 750 ${pkgdir}/usr/bin/*
    chmod 755 ${pkgdir}/usr/bin/ff_init

    chown root:root ${pkgdir}/usr/lib/addons/*wifi.bash
    chmod 600 ${pkgdir}/usr/lib/addons/*wifi.bash
}
