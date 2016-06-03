#!/bin/sh

pkgname=python2-setuptools
ARCH_NAME=python-setuptools
pkgver=22.0.5
vcs=git
vcs_pkgname=setuptools
gittag=v${pkgver}
urls="http://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz"
srctar=setuptools-${pkgver}.tar.gz
srcdir=${location}/setuptools-${pkgver}

kiin_make() {
    python2 bootstrap.py
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --prefix=/usr \
        --root=${pkgdir} --optimize=1 --skip-build
    # remove files with spaces in filenames
    rm ${pkgdir}/usr/lib/python2.7/site-packages/setuptools/script*
    rm ${pkgdir}/usr/bin/easy_install
}
