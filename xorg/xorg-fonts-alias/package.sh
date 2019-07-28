_pkgname=font-alias
pkgname=xorg-fonts-alias
pkgver=1.0.3
vcs=git
gittag=${_pkgname}-${pkgver}
relmon_id=15059

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
