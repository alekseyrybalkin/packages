pkgname=python-scipy
pkgver=1.3.0
vcs=git
vcs_pkgname=scipy
gittag=v${pkgver}
relmon_id=4768
relmon_rules="skip_rc"

build() {
    python setup.py config_fc --fcompiler=gnu95 build
}

package() {
    python setup.py config_fc --fcompiler=gnu95 install \
        --prefix=/usr --root=${pkgdir} --optimize=1
}