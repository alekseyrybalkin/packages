pkgname=freetype
ARCH_NAME=freetype2
pkgver=2.10.0
vcs=git
vcs_pkgname=freetype2
gittag=VER-${pkgver//\./-}
relmon_id=854

build() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
