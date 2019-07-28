pkgname=borg
pkgver=1.1.10
vcs=git
gittag=${pkgver}
relmon_id=10446
relmon_rules="skip_a,skip_b,skip_rc"

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm644 -t ${pkgdir}/usr/share/man/man1/ docs/man/*.1
}
