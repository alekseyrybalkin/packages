pkgname=python-requests
pkgver=2.22.0
vcs=git
vcs_pkgname=requests
gittag=v${pkgver}
relmon_id=4004

build() {
    python setup.py build
    cd docs
    make html
}

package() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-requests
}