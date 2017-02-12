#!/bin/sh

pkgname=python2-jinja
ARCH_NAME=python-jinja
pkgver=2.9.5
vcs=git
vcs_pkgname=jinja2
gittag=${pkgver}
urls="http://pypi.python.org/packages/source/J/Jinja2/Jinja2-${pkgver}.tar.gz"
srctar=Jinja2-${pkgver}.tar.gz
srcdir=${location}/Jinja2-${pkgver}

kiin_make() {
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --root=${pkgdir}
}
