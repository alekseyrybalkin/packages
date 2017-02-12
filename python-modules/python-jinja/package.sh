#!/bin/sh

pkgname=python-jinja
pkgver=2.9.5
vcs=git
vcs_pkgname=jinja2
gittag=${pkgver}
urls="http://pypi.python.org/packages/source/J/Jinja2/Jinja2-${pkgver}.tar.gz"
srctar=Jinja2-${pkgver}.tar.gz
srcdir=${location}/Jinja2-${pkgver}

kiin_make() {
    python setup.py build
    cd docs
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-jinja
}
