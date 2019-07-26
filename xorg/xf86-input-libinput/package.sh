pkgname=xf86-input-libinput
pkgver=0.28.2
vcs=git
gittag=${pkgname}-${pkgver}

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
