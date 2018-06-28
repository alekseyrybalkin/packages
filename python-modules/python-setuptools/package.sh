#!/bin/sh

pkgname=python-setuptools
pkgver=39.0.1
vcs=git
vcs_pkgname=setuptools
gittag=v${pkgver}
urls="http://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz"
srctar=setuptools-${pkgver}.tar.gz
relmon_id=4021

undead_make() {
    sed -i -e 's/launcher manifest/launcher_manifest/g' setuptools/command/easy_install.py
    mv setuptools/command/launcher{\ ,_}manifest.xml
    python bootstrap.py
    python setup.py build
}

undead_install() {
    python setup.py install --prefix=/usr \
        --root=${pkgdir} --optimize=1 --skip-build
    # remove files with spaces in filenames
    rm ${pkgdir}/usr/lib/python3.6/site-packages/setuptools/script*
}
