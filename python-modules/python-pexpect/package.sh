#!/bin/sh

pkgname=python-pexpect
pkgver=4.3
ARCH_VERSION=${pkgver}.0
vcs=git
vcs_pkgname=pexpect
gittag=${pkgver}
relmon_id=13058

kiin_make() {
    :
}

kiin_install() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=0
}
