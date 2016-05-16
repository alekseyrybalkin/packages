#!/bin/sh

pkgname=python-gunicorn
SKIP_ARCH_CHECK=1
pkgver=19.5.0
vcs=git
vcs_pkgname=gunicorn
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
