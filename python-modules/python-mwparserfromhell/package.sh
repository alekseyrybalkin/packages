#!/bin/sh

pkgname=python-mwparserfromhell
pkgver=0.5.4
vcs=git
vcs_pkgname=mwparserfromhell
gittag=v${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
