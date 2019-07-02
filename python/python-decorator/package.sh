#!/bin/sh

pkgname=python-decorator
pkgver=4.4.0
vcs=git
vcs_pkgname=decorator
gittag=remotes/origin/origin/${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
