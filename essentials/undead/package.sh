#!/bin/sh

pkgname=undead
SKIP_ARCH_CHECK=1
pkgver=38
vcs=git
gittag=v${pkgver}

undead_make() {
    true
}

undead_install() {
    mkdir -p ${pkgdir}/{etc,usr/bin,usr/lib/undead}
    cp undead.bash ${pkgdir}/usr/bin/undead
    cp undead-utils.py ${pkgdir}/usr/lib/undead
    cp undead.conf.bash ${pkgdir}/etc
}
