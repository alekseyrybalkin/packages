#!/bin/sh

pkgname=python-pytz
pkgver=2017.2
vcs=git
vcs_pkgname=pytz
gittag=release_${pkgver}
urls="https://pypi.python.org/packages/ad/30/5ab2298c902ac92fdf649cc07d1b7d491a241c5cac8be84dd84464db7d8b/pytz-${pkgver}.tar.gz"
srctar=pytz-${pkgver}.tar.gz
relmon_id=6537

kiin_make() {
    git apply ../2016.6.1.patch
    MAKEFLAGS=
    sed -i -e 's/python2.4/python2.7/g' Makefile
    sed -i -e 's/python2.5/python2.7/g' Makefile
    sed -i -e 's/python2.6/python2.7/g' Makefile
    sed -i -e 's/python3.1/python3.6/g' Makefile
    sed -i -e 's/python3.2/python3.6/g' Makefile
    sed -i -e 's/python3.3/python3.6/g' Makefile
    sed -i -e 's/python3.4/python3.6/g' Makefile
    sed -i -e 's/python3.5/python3.6/g' Makefile
    make build eggs
    cd src
    python setup.py build
}

kiin_install() {
    cd src
    python setup.py install --root=${pkgdir}
}
