#!/bin/sh

pkgname=python-ptyprocess
pkgver=0.6.0
vcs=git
vcs_pkgname=ptyprocess
gittag=${pkgver}
relmon_id=6447

build() {
    cp ../setup.py .
}

package() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=0
}
