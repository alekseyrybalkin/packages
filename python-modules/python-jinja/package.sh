#!/bin/sh

pkgname=python-jinja
pkgver=2.8
vcs=git
git_pkgname=jinja2
gittag=${pkgver}
urls="http://pypi.python.org/packages/source/J/Jinja2/Jinja2-${pkgver}.tar.gz"
srctar=Jinja2-${pkgver}.tar.gz
srcdir=${location}/Jinja2-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
