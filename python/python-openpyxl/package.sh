pkgname=python-openpyxl
pkgver=2.6.2
vcs=mercurial
vcs_pkgname=openpyxl
hgtag=${pkgver}
# beta versions
#relmon_id=8098

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
