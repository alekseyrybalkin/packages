pkgname=libva-intel-driver
pkgver=2.3.0
vcs=git
vcs_pkgname=intel-vaapi-driver
gittag=${pkgver}
relmon_id=1753

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}