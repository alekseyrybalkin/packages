pkgname=python-idna
pkgver=2.8
vcs=git
vcs_pkgname=idna
gittag=v${pkgver}
relmon_id=5487

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
