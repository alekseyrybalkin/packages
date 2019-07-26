#!/bin/sh

pkgname=python-chardet
pkgver=3.0.4
vcs=git
vcs_pkgname=chardet
gittag=${pkgver}
relmon_id=9523

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
