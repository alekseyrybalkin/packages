pkgname=python-parso
pkgver=0.5.1
vcs=git
vcs_pkgname=parso
gittag=v${pkgver}
relmon_id=16689

build() {
    :
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
