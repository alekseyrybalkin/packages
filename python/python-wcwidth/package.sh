pkgname=python-wcwidth
pkgver=0.1.7
vcs=git
vcs_pkgname=wcwidth
gittag=${pkgver}
relmon_id=8743

build() {
    :
}

package() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
