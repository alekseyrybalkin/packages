pkgname=python-pandas
pkgver=0.25.0
vcs=git
vcs_pkgname=pandas
gittag=v${pkgver}
relmon_id=7578

build() {
    python setup.py build_ext --inplace
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
