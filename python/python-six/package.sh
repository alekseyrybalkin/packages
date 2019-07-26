#!/bin/sh

pkgname=python-six
pkgver=1.12.0
vcs=git
vcs_pkgname=six
gittag=${pkgver}
relmon_id=4027

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
