pkgname=python-sphinx-issues
SKIP_ARCH_CHECK=1
pkgver=1.2.0
vcs=git
vcs_pkgname=sphinx-issues
gittag=${pkgver}
relmon_id=19226

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
