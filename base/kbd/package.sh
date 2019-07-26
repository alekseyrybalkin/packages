pkgname=kbd
pkgver=2.0.4
vcs=git
gittag=${pkgver}
relmon_id=1492

build() {
    ./autogen.sh
    sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
    ./configure --prefix=/usr \
        --disable-vlock \
        --disable-tests
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
