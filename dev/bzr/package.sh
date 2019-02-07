#!/bin/sh

pkgname=bzr
pkgver=2.7.0
vcs=bzr
vcs_clone='bzr branch lp:bzr'
bzrtag=bzr-${pkgver}
urls="http://launchpad.net/bzr/${pkgver%.*}/${pkgver}/+download/bzr-${pkgver}.tar.gz"
srctar=bzr-${pkgver}.tar.gz
relmon_id=238

kiin_make() {
    sed 's|man/man1|share/man/man1|' -i setup.py
    sed 's|/usr/bin/env python|/usr/bin/env python2|' -i bzrlib/{plugins/bash_completion/bashcomp.py,tests/ssl_certs/create_ssls.py,patiencediff.py,_patiencediff_py.py}
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
