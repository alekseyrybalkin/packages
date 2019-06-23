#!/bin/sh

pkgname=addons
pkgver=1
vcs=git

kiin_make() {
    ./bootstrap
}

kiin_install() {
    cp -av etc usr ${pkgdir}/

    chown root:${PACMAN} ${pkgdir}/usr/bin/*
    chmod 750 ${pkgdir}/usr/bin/*
    chmod 755 ${pkgdir}/usr/bin/ff_init

    chown root:root ${pkgdir}/usr/lib/addons/*wifi.bash
    chmod 600 ${pkgdir}/usr/lib/addons/*wifi.bash
}
