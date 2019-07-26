pkgname=python-pyparsing
pkgver=2.4.0
vcs=git
vcs_pkgname=pyparsing
gittag=pyparsing_${pkgver}
relmon_id=3756

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
