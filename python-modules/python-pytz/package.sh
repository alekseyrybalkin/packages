#!/bin/sh

pkgname=python-pytz
pkgver=2016.4
vcs=bzr
bzrtag=release_${pkgver}
urls="https://pypi.python.org/packages/ad/30/5ab2298c902ac92fdf649cc07d1b7d491a241c5cac8be84dd84464db7d8b/pytz-${pkgver}.tar.gz"
srctar=pytz-${pkgver}.tar.gz
srcdir=${location}/pytz-${pkgver}

kiin_make() {
    MAKEFLAGS=
    export LC_ALL=en_US.UTF-8
    sed -i -e 's/python2.4/python2.7/g' Makefile
    sed -i -e 's/python2.5/python2.7/g' Makefile
    sed -i -e 's/python2.6/python2.7/g' Makefile
    sed -i -e 's/python3.1/python3.5/g' Makefile
    sed -i -e 's/python3.2/python3.5/g' Makefile
    sed -i -e 's/python3.3/python3.5/g' Makefile
    sed -i -e 's/python3.4/python3.5/g' Makefile
    make build eggs
    cd src
    python setup.py build
}

kiin_install() {
    cd src
    python setup.py install --root=${pkgdir}
}
