pkgname=python-backcall
SKIP_ARCH_CHECK=1
pkgver=0.1
vcs=git
vcs_pkgname=backcall
gittag=${pkgver}
relmon_id=19636

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
