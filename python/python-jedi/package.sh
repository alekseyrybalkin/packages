pkgname=python-jedi
pkgver=0.14.1
vcs=git
vcs_pkgname=jedi
gittag=v${pkgver}
relmon_id=3893

build() {
    git clone `find_vcs_repo typeshed` jedi/third_party/typeshed
    git submodule update --init
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}