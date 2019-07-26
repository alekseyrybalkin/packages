#!/bin/sh

pkgname=configs
SKIP_ARCH_CHECK=1
pkgver=1
vcs=git

build() {
    ./bootstrap
}

package() {
    cp -av etc usr ${pkgdir}/

    chmod 440 ${pkgdir}/etc/sudoers
    chmod 600 ${pkgdir}/etc/crypttab
}
