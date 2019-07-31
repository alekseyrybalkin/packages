pkgname=python-greenlet
pkgver=0.4.15
vcs=git
vcs_pkgname=greenlet
gittag=${pkgver}
relmon_id=6870

build() {
    python setup.py build
    cd doc
    make html
}

package() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r doc/_build/html ${pkgdir}/usr/share/doc/python-greenlet
}
