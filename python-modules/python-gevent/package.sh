#!/bin/sh

pkgname=python-gevent
pkgver=1.2.2
vcs=git
vcs_pkgname=gevent
gittag=${pkgver}
relmon_id=6835

undead_make() {
    # disable auto-pickling in cython
    git cherry-pick 4c25c7de7bca39b753e177837fa1bdff0fb7ecf1
    # apparently, gevent cannot autodetect PATH_SEPARATOR when there is only one
    # item in $PATH (see zz40-xc-ovr.m4)
    PATH=${PATH}:/bin
    sed -i 's/C.UTF-8/en_US.UTF-8/' Makefile
    EMBED=1 \
    CYTHON=cython \
    PYTHON=python \
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
