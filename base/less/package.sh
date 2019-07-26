pkgname=less
pkgver=551
vcs=git
gittag=v${pkgver}
relmon_id=1550

build() {
    # generate defines.h.in
    autoheader

    # don't create tarball
    sed -i -e '/gpg/d' Makefile.aut
    sed -i -e '/zip/d' Makefile.aut
    sed -i -e '/tar/d' Makefile.aut
    sed -i -e 's/rm -rf $$REL/true/g' Makefile.aut

    # prepare sources in less-${pkgver}
    make -f Makefile.aut dist

    cd less-${pkgver}
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd less-${pkgver}
    make prefix=${pkgdir}/usr install
}
