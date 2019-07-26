pkgname=xkeyboard-config
pkgver=2.27
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=5191

build() {
    ./autogen.sh $XORG_CONFIG --with-xkb-rules-symlink=xorg
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
