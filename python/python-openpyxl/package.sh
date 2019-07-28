pkgname=python-openpyxl
pkgver=2.6.2
vcs=mercurial
vcs_pkgname=openpyxl
hgtag=${pkgver}
relmon_id=8098
relmon_rules="skip_a,skip_b"

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
