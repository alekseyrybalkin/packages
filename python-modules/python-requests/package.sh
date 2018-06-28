#!/bin/sh

pkgname=python-requests
pkgver=2.18.4
vcs=git
vcs_pkgname=requests
gittag=v${pkgver}
relmon_id=4004

undead_make() {
    # allow idna 2.6
    sed -i -e 's/idna>=2.5,<2.6/idna>=2.5,<2.7/g' setup.py

    python setup.py build
    cd docs
    make html
}

undead_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-requests
}
