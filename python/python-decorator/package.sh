pkgname=python-decorator
pkgver=4.4.0
vcs=git
vcs_pkgname=decorator
gittag=remotes/origin/origin/${pkgver}
relmon_id=3819

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
