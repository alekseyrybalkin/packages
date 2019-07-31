pkgname=swig
pkgver=4.0.0
vcs=git
gittag=rel-${pkgver}
relmon_id=4919

build() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
