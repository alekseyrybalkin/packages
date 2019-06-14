#!/bin/sh

pkgname=addons
pkgver=1
vcs=git

kiin_make() {
    :
}

kiin_install() {
    cp -av etc usr ${pkgdir}/

    echo "$(hostname)" > ${pkgdir}/etc/hostname

    chown root:${PACMAN} ${pkgdir}/usr/bin/*
    chmod 750 ${pkgdir}/usr/bin/*

    chown root:root ${pkgdir}/usr/lib/addons/*wifi.bash
    chmod 600 ${pkgdir}/usr/lib/addons/*wifi.bash
}
