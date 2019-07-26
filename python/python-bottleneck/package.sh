#!/bin/sh

pkgname=python-bottleneck
pkgver=1.2.1
vcs=git
vcs_pkgname=bottleneck
gittag=v${pkgver}
relmon_id=3787

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
