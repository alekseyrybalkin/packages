#!/bin/sh

pkgname=python-falcon
SKIP_ARCH_CHECK=1
pkgver=1.0.0
vcs=git
vcs_pkgname=falcon
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    # Migrate to sphinx.ext.napolean
    git cherry-pick ad95b0ef281c65b34994858ebd445d2296c508ae
    python setup.py build
    cd doc
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r doc/_build/html ${pkgdir}/usr/share/doc/python-falcon
}
