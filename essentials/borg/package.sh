#!/bin/sh

pkgname=borg
pkgver=1.1.10
vcs=git
gittag=${pkgver}
# alpha versions
#relmon_id=10446

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm644 -t ${pkgdir}/usr/share/man/man1/ docs/man/*.1
}
