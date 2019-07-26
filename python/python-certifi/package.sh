pkgname=python-certifi
pkgver=2019.06.16
ARCH_VERSION=2019.6.16
vcs=git
gittag=${pkgver}
# tags != versions
#relmon_id=7995

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
