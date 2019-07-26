pkgname=python-traitlets
pkgver=4.3.2
vcs=git
vcs_pkgname=traitlets
gittag=${pkgver}

build() {
    # TODO: remove in the future
    git clone --branch 0.2.0 `find_vcs_repo ipython_genutils`
}

package() {
    # TODO: remove in the future
    cd ipython_genutils
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=0
    cd ../
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=0
}
