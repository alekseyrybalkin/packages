pkgname=python-flask
pkgver=1.0.3
vcs=git
vcs_pkgname=flask
gittag=${pkgver}
relmon_id=3867

build() {
    python setup.py build
    cd docs
    make html
}

package() {
    python setup.py install --prefix=/usr --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-flask
}
