pkgname=libogg
pkgver=1.3.3
vcs=git
gittag=v${pkgver}
relmon_id=1694

build() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}