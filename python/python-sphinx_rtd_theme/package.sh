#!/bin/sh

pkgname=python-sphinx_rtd_theme
pkgver=0.4.3
vcs=git
vcs_pkgname=sphinx_rtd_theme
gittag=${pkgver}
relmon_id=6915

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
