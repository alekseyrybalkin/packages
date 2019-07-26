#!/bin/sh

pkgname=offlineimap
pkgver=7.2.4
vcs=git
gittag=v${pkgver}
relmon_id=2534

build() {
    patch -Np1 -i ../ca-bundle-path.patch

    find . -type f -exec sed '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' -i {} \;
    python2 setup.py build
    cd docs
    make man
}

package() {
    python2 setup.py install --root=${pkgdir} --optimize=1
    install -Dm644 docs/offlineimap.1 ${pkgdir}/usr/share/man/man1/offlineimap.1
    install -Dm644 docs/offlineimapui.7 ${pkgdir}/usr/share/man/man7/offlineimapui.7
    install -Dm644 offlineimap.conf ${pkgdir}/usr/share/offlineimap/offlineimap.conf
    install -Dm644 offlineimap.conf.minimal ${pkgdir}/usr/share/offlineimap/offlineimap.conf.minimal

    #systemd files
    install -Dm644 contrib/systemd/${pkgname}.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service
    install -Dm644 contrib/systemd/${pkgname}@.service ${pkgdir}/usr/lib/systemd/user/${pkgname}@.service
    install -Dm644 contrib/systemd/${pkgname}-oneshot.service ${pkgdir}/usr/lib/systemd/user/${pkgname}-oneshot.service
    install -Dm644 contrib/systemd/${pkgname}-oneshot.timer ${pkgdir}/usr/lib/systemd/user/${pkgname}-oneshot.timer
    install -Dm644 contrib/systemd/${pkgname}-oneshot@.service ${pkgdir}/usr/lib/systemd/user/${pkgname}-oneshot@.service
    install -Dm644 contrib/systemd/${pkgname}-oneshot@.timer ${pkgdir}/usr/lib/systemd/user/${pkgname}-oneshot@.timer
}
