#!/bin/sh

pkgname=python-setuptools
pkgver=32.1.2
vcs=git
vcs_pkgname=setuptools
gittag=v${pkgver}
urls="http://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz"
srctar=setuptools-${pkgver}.tar.gz
srcdir=${location}/setuptools-${pkgver}

kiin_make() {
    sed -i -e 's/launcher manifest/launcher_manifest/g' setuptools/command/easy_install.py
    mv setuptools/command/launcher{\ ,_}manifest.xml
    python bootstrap.py
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr \
        --root=${pkgdir} --optimize=1 --skip-build
    # remove files with spaces in filenames
    rm ${pkgdir}/usr/lib/python3.6/site-packages/setuptools/script*
}
