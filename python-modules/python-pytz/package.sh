#!/bin/sh

#vcs=bazaar
pkgname=python-pytz
pkgver=2016.3
urls="http://pypi.python.org/packages/source/p/pytz/pytz-${pkgver}.tar.gz"
srctar=pytz-${pkgver}.tar.gz
srcdir=${location}/pytz-${pkgver}

kiin_make() {
    export LC_ALL=en_US.UTF-8
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
