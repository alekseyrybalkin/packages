pkgname=libcroco
pkgver=0.6.13
vcs=git
gittag=${pkgver}
relmon_id=11787

build() {
    # disable gtk-doc
    sed -i -e '/gtkdocize/d' autogen.sh
    sed -i -e '/docs/d' configure.ac
    sed -i -e '/GTK_DOC_CHECK/d' configure.ac
    sed -i -e 's/docs tests/tests/g' Makefile.am
    rm -rf docs

    ./autogen.sh --prefix=/usr --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
