pkgname=mercurial
pkgver=5.0.1
vcs=mercurial
hgtag=${pkgver}
relmon_id=1969
relmon_rules="skip_rc"

build() {
    sed -i -e 's#env python#env python2#' mercurial/lsprof.py
    sed -i -e 's/python/python2/g' doc/{docchecker,check-seclevel.py,runrst,Makefile,gendoc.py}
    cd doc
    make
}

package() {
    python2 setup.py install --root=${pkgdir}/ --optimize=1
    install -d ${pkgdir}/usr/share/man/{man1,man5}
    install -m644 doc/hg.1 ${pkgdir}/usr/share/man/man1
    install -m644 doc/{hgrc.5,hgignore.5} ${pkgdir}/usr/share/man/man5
}
