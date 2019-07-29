pkgname=python-lxml
pkgver=4.4.0
vcs=git
vcs_pkgname=lxml
gittag=lxml-${pkgver}
relmon_id=3914

build() {
    # python3
    sed -i -e 's/itervalues/values/g' doc/mkhtml.py
    python setup.py build

    cd doc
    python mkhtml.py html .. ${pkgver}
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
    mkdir -p ${pkgdir}/usr/share/doc
    cp -r doc/html ${pkgdir}/usr/share/doc/python-lxml
}
