pkgname=python-jdcal
pkgver=1.4.1
vcs=git
vcs_pkgname=jdcal
gittag=v${pkgver}
relmon_id=7978

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}