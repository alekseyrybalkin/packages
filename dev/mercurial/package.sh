#!/bin/sh

pkgname=mercurial
pkgver=4.1
vcs=mercurial
hgtag=${pkgver}
extension=gz
folder="http://mercurial.selenic.com/release/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    sed -i -e 's#env python#env python2#' mercurial/lsprof.py
    sed -i -e 's/python/python2/g' doc/{docchecker,check-seclevel.py,runrst,Makefile,gendoc.py}
    cd doc
    make
}

kiin_install() {
    python2 setup.py install --root=${pkgdir}/ --optimize=1
    install -d ${pkgdir}/usr/share/man/{man1,man5}
    install -m644 doc/hg.1 ${pkgdir}/usr/share/man/man1
    install -m644 doc/{hgrc.5,hgignore.5} ${pkgdir}/usr/share/man/man5
}
