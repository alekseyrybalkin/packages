pkgname=python-babel
pkgver=2.7.0
_cldr_core_ver=35.1
vcs=git
vcs_pkgname=babel
gittag=v${pkgver}
relmon_id=11984

build() {
    rm -rf cldr
    git clone -s -n `find_vcs_repo cldr`
    cd cldr
    git checkout release-${_cldr_core_ver//\./-}
    cd ../

    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
