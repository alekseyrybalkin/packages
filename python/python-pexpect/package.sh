pkgname=python-pexpect
pkgver=4.7.0
vcs=git
vcs_pkgname=pexpect
gittag=${pkgver}
relmon_id=13058

build() {
    :
}

package() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=0
}
