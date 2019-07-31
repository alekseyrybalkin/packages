_pkgname=encodings
pkgname=xorg-fonts-${_pkgname}
pkgver=1.0.5
vcs=git
gittag=${_pkgname}-${pkgver}
relmon_id=15051

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
