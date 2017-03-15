#!/bin/sh

pkgname=python-gunicorn
SKIP_ARCH_CHECK=1
pkgver=19.7.0
vcs=git
vcs_pkgname=gunicorn
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
    cd docs
    make html
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/build/html ${pkgdir}/usr/share/doc/python-gunicorn
}
