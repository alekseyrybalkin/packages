pkgname=python-et-xmlfile
pkgver=1.0.1
vcs=mercurial
vcs_pkgname=et_xmlfile
hgtag=${pkgver}
relmon_id=15065

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
