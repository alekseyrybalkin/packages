pkgname=lcms
ARCH_NAME=lcms2
pkgver=2.9
vcs=git
gittag=lcms${pkgver}
# rc versions
#relmon_id=9815

build() {
    ./autogen.sh --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
