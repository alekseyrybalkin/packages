#!/bin/sh

pkgname=python2-setuptools
ARCH_NAME=python-setuptools
pkgver=41.0.1
vcs=git
vcs_pkgname=setuptools
gittag=v${pkgver}
relmon_id=4021

kiin_make() {
    sed -i -e 's/launcher manifest/launcher_manifest/g' setuptools/command/easy_install.py
    mv setuptools/command/launcher{\ ,_}manifest.xml
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
