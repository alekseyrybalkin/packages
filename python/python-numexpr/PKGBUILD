pkgname=python-numexpr
pkgver=2.6.9
vcs=git
vcs_pkgname=numexpr
gittag=v${pkgver}
relmon_id=3943

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
