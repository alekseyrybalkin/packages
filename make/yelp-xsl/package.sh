pkgname=yelp-xsl
pkgver=3.32.1
vcs=git
gittag=${pkgver}
# rc versions
#relmon_id=13164

build() {
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
