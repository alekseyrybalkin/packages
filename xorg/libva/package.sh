pkgname=libva
pkgver=2.4.1
vcs=git
gittag=${pkgver}
relmon_id=1752
relmon_rules="skip_pre"

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
