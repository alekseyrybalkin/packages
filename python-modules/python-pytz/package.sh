#!/bin/sh

#vcs=bazaar
pkgname=python-pytz
pkgver=2016.4
urls="https://pypi.python.org/packages/ad/30/5ab2298c902ac92fdf649cc07d1b7d491a241c5cac8be84dd84464db7d8b/pytz-${pkgver}.tar.gz"
srctar=pytz-${pkgver}.tar.gz
srcdir=${location}/pytz-${pkgver}

kiin_make() {
    export LC_ALL=en_US.UTF-8
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
