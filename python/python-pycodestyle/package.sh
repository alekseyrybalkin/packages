pkgname=python-pycodestyle
pkgver=2.5.0
vcs=git
vcs_pkgname=pycodestyle
gittag=${pkgver}
relmon_id=11773

build() {
    python setup.py build
    cd docs
    make html
}

package() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-pycodestyle
}
