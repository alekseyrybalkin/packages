pkgname=python-pyparsing
pkgver=2.4.1.1
vcs=git
vcs_pkgname=pyparsing
gittag=pyparsing_${pkgver}
relmon_id=3756
relmon_rules="skip_a"

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
