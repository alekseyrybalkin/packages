pkgname=python2-pyparsing
ARCH_NAME=python-pyparsing
pkgver=2.4.2
vcs=git
vcs_pkgname=pyparsing
gittag=pyparsing_${pkgver}
relmon_id=3756
relmon_rules="skip_a"

build() {
    python2 setup.py build
}

package() {
    python2 setup.py install --root=${pkgdir}
}
