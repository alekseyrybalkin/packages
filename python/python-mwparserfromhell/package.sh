#!/bin/sh

pkgname=python-mwparserfromhell
pkgver=0.5.4
vcs=git
vcs_pkgname=mwparserfromhell
gittag=v${pkgver}

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
