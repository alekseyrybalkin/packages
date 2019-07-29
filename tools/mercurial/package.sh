pkgname=mercurial
pkgver=5.0.2
vcs=mercurial
hgtag=${pkgver}
relmon_id=1969
relmon_rules="skip_rc"

build() {
    export HGPYTHON3=1
    cd doc
    make
}

package() {
    export HGPYTHON3=1
    python setup.py install --root=${pkgdir}/ --optimize=1
    install -d ${pkgdir}/usr/share/man/{man1,man5}
    install -m644 doc/hg.1 ${pkgdir}/usr/share/man/man1
    install -m644 doc/{hgrc.5,hgignore.5} ${pkgdir}/usr/share/man/man5
}
