pkgname=yelp-xsl
pkgver=3.32.1
vcs=git
gittag=${pkgver}
relmon_id=13164
relmon_rules="skip_odd_second"

build() {
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
