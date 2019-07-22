#!/bin/sh

pkgname=python-pytz
pkgver=2019.1
vcs=git
vcs_pkgname=pytz
gittag=release_${pkgver}
relmon_id=6537

kiin_make() {
    patch -Np1 -i ../gen_tzdata_fix.patch
    MAKEFLAGS=
    sed -i -e 's/python2.4/python2.7/g' Makefile
    sed -i -e 's/python2.5/python2.7/g' Makefile
    sed -i -e 's/python2.6/python2.7/g' Makefile
    sed -i -e 's/python3.1/python3.7/g' Makefile
    sed -i -e 's/python3.2/python3.7/g' Makefile
    sed -i -e 's/python3.3/python3.7/g' Makefile
    sed -i -e 's/python3.4/python3.7/g' Makefile
    sed -i -e 's/python3.5/python3.7/g' Makefile
    sed -i -e 's/python3.6/python3.7/g' Makefile
    make build wheels
    python gen_tzinfo.py
    cd src
    python setup.py build
}

kiin_install() {
    cd src
    python setup.py install --root=${pkgdir}
    cp -r ../build/dist/build/lib/pytz/* ${pkgdir}/usr/lib/python3.7/site-packages/pytz
}
