#!/bin/sh

pkgname=python-traitlets
pkgver=4.3.2
vcs=git
vcs_pkgname=traitlets
gittag=${pkgver}

undead_make() {
    # TODO: remove in the future
    git clone --branch 0.2.0 ${SOURCES_HOME}/ipython_genutils
}

undead_install() {
    # TODO: remove in the future
    cd ipython_genutils
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=0
    cd ../
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=0
}
